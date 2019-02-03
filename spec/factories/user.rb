# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'Alex Souza' }
    spotify_url { 'Simple_URL' }
    uri { 'Simple_URI' }
    href { 'Simple_REF' }
  end
end
