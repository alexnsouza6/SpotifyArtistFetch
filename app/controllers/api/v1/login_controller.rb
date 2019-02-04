# frozen_string_literal: true

# LoginController is responsible for make a request to Spotify Auth API
class Api::V1::LoginController < ApplicationController
  def create
    # Assemble query params w/ env vars and scopes according w/ Spotify API
    query_params = {
      client_id: ENV['CLIENT_ID'],
      response_type: 'code',
      redirect_uri: ENV['REDIRECT_URI'],
      scope: 'user-follow-read',
      show_dialog: true
    }
    url = 'https://accounts.spotify.com/authorize/'

    # Force a redirection to a specific url to handle Spotify auth
    redirect_to "#{url}?#{query_params.to_query}"
  end
end
