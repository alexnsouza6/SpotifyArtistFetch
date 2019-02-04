# frozen_string_literal: true

# User model contains specifics validations and associations instrisic to class
class User < ApplicationRecord
  # Associations
  has_many :follows
  has_many :artists, through: :follows

  # Validations
  with_options presence: true do
    validates :username, uniqueness: true
    validates :spotify_url
    validates :href
    validates :uri
  end
end
