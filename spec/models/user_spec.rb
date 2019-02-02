require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:spotify_url) }
    it { is_expected.to validate_presence_of(:href) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:uri) }
  end
end
