# config/routes.rb
Rails.application.routes.draw do
  root to: 'comics#index'

  resources :comics, only: [:index] do
    collection do
      get ':page', action: :index
      get 'search', action: :search
    end
  end
end 