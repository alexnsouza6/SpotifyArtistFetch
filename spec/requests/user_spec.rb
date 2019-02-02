require 'rails_helper'

RSpec.describe 'User API', type: :request do
  describe 'when testing requests' do
    context 'GET /api/v1/callback' do
      context 'when params[:error]' do
        before do
          get '/api/v1/callback', params: { error: 'There is an error' }
        end

        it 'returns http 422 status code' do
          expect(response).to have_http_status(422)
        end

        it 'renders a json with errors' do
          json = JSON.parse(response.body)
          expect(json['error']).to eq 'There is an error'
        end
      end

      context 'when !params["error]' do
        before do
          get '/api/v1/callback'
        end

        it 'instances a user' do
          expect(assigns(:user)).not_to be_nil
        end

        it 'redirects user to his main page' do
          expect(response).to redirect_to('http://localhost:3001/')
        end
      end
    end
  end
end
