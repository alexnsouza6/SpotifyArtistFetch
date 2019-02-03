require 'rails_helper'

RSpec.describe Follow, type: :model do
  context 'when testing associations' do
    it { is_expected.to belong_to(:artist) }
    it { is_expected.to belong_to(:user) }
  end
end
