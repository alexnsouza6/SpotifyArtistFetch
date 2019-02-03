class User < ApplicationRecord
  has_many :follows
  has_many :artists, through: :follows
  with_options presence: true do
    validates :username, uniqueness: true
    validates :spotify_url
    validates :href
    validates :uri
  end
end
