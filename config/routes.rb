# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'login', to: 'login#create'
      get 'callback', to: 'users#create'
      get 'user', to: 'users#fetch_user'
      get 'artists', to: 'artists#fetch'
    end
  end
end
