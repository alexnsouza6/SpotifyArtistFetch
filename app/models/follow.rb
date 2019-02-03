# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :artist
  belongs_to :user
end
