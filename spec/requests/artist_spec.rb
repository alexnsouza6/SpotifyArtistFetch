# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Artist API', type: :request do
  describe 'when testing requests' do
    context 'GET /api/v1/artists' do
      before do
        FactoryBot.create(:user)
        get '/api/v1/artists', params: { name: 'Alex Souza' }
      end

      it 'returns http status 200' do
        expect(response).to have_http_status(200)
      end

      it 'renders an artist collection' do
        artists = JSON.parse(response.body)
        expect(artists.length).to be > 0
      end
    end
  end
end
