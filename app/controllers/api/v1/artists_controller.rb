# frozen_string_literal: true
# This controller is responsible for handle artists data
class Api::V1::ArtistsController < ApplicationController
  def fetch

    # Fetches user through request params
    user = User.find_by(username: artists_params['name'])

    header = {
      Authorization: "Bearer #{user.access_token}"
    }

    # Make a request with user's auth token
    artists_response = RestClient.get('https://api.spotify.com/v1/me/following?type=artist', header)

    artists_params = JSON.parse(artists_response)
    
    # Catches artists inside query response
    @artists = artists_params['artists']['items']

    create_artists(@artists, user)

    render json: @artists, status: 200
  end

  def create_artists(artists, user)
    # Loop through each artist, saving it inside db
    artists.each do |artist|
      artist = Artist.find_or_create_by(name: artist['name'],
                                        spotify_url: artist['external_urls']['spotify'],
                                        href: artist['href'],
                                        uri: artist['uri'],
                                        genre: artist['genres'][0],
                                        popularity: artist['popularity'],
                                        images: artist['images'][0]['url'])
      artist.users << user
      artist.save
    end
  end

  protected

  def artists_params
    params.permit(:name)
  end
end
