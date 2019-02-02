class User < ApplicationRecord
  with_options presence: true do
    validates :username, uniqueness: true
    validates :spotify_url
    validates :href
    validates :uri
  end
end
