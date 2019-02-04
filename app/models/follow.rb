# frozen_string_literal: true

# Follow model contains specifics associations instrisic to class itself
class Follow < ApplicationRecord
  # Associations
  belongs_to :artist
  belongs_to :user
end
