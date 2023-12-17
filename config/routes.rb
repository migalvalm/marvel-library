# config/routes.rb
Rails.application.routes.draw do
  root to: 'comics#index', page: '1'

  resources :comics, only: [:index] do
    collection do
      get ':page', action: :index
    end
  end
end 