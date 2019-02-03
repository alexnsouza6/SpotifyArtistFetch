# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.string :href
      t.integer :popularity
      t.string :uri
      t.string :images
      t.string :spotify_url

      t.timestamps
    end
  end
end
