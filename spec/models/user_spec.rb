# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when testing associations' do
    it { is_expected.to have_many(:follows) }
    it { is_expected.to have_many(:artists).through(:follows) }
  end
  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:spotify_url) }
    it { is_expected.to validate_presence_of(:href) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:uri) }
  end
end
