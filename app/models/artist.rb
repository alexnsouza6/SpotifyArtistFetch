# frozen_string_literal: true

# Artist model contains specifics validations and associations instrisic to class
class Artist < ApplicationRecord
  # Associations
  has_many :follows
  has_many :users, through: :follows

  # Validations
  with_options presence: true do
    validates :name, uniqueness: true
    validates :genre
    validates :href
    validates :popularity
    validates :images
    validates :uri
    validates :spotify_url
  end
end
