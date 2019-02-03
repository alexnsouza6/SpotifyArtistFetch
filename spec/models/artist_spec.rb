# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'when testing associations' do
    it { is_expected.to have_many(:follows) }
    it { is_expected.to have_many(:users).through(:follows) }
  end
  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:spotify_url) }
    it { is_expected.to validate_presence_of(:href) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:uri) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:images) }
    it { is_expected.to validate_presence_of(:popularity) }
  end
end
