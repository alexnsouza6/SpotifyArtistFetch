class Artist < ApplicationRecord
  has_many :follows
  has_many :users, through: :follows
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
