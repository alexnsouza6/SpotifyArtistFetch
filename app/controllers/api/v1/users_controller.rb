# frozen_string_literal: true

# UsersController handles user creation, using its credentials to access Spotify API
class Api::V1::UsersController < ApplicationController
  def create
    if params[:error]
      render json: { error: params[:error] }, status: 422
    else
      # Parse all responses
      auth_params = JSON.parse(auth_credentials.body)

      user_response = user_credentials(auth_params)

      user_params = JSON.parse(user_response.body)

      # Find or create an user using response data
      @user = User.find_or_create_by(username: user_params['display_name'],
                                     spotify_url: user_params['external_urls']['spotify'],
                                     href: user_params['href'],
                                     uri: user_params['uri'])
      @user.update(access_token: auth_params['access_token'], refresh_token: auth_params['refresh_token'])

      redirect_to 'https://spotify-your-artists.herokuapp.com'
    end
  end

  def fetch_user
    # fetch_user fetches a user and renders it inside a json file
    @user = User.last
    if @user
      render json: @user, status: 200
    else
      render json: { error: { msg: "There's no users" } }, status: 422
    end
  end

  protected

  def auth_credentials
    # Assembles Auth credentials to prepare Spotify API for other requests
    body = {
      grant_type: 'authorization_code',
      code: params[:code],
      redirect_uri: ENV['REDIRECT_URI'],
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET']
    }

    RestClient.post('https://accounts.spotify.com/api/token', body)
  end

  def user_credentials(auth_params)
    # Assembles the request to Spotify /me API URL
    header = {
      Authorization: "Bearer #{auth_params['access_token']}"
    }

    RestClient.get('https://api.spotify.com/v1/me', header)
  end
end
