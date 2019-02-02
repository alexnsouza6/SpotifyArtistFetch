require 'rails_helper'

RSpec.describe 'Login API', type: :request do
  describe 'when testing requests' do
    context 'GET /api/v1/login' do
      before do
        get '/api/v1/login'
      end

      it 'returns http status 302 (redirection)' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to Spotify authorization section' do
        query_params = {
          client_id: Figaro.env.client_id,
          response_type: 'code',
          redirect_uri: Figaro.env.redirect_uri,
          scope: 'user-follow-read',
          show_dialog: true
        }
        url = 'https://accounts.spotify.com/authorize/'
        expect(response).to redirect_to("#{url}?#{query_params.to_query}")
      end
    end
  end
end
