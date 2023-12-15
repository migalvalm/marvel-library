# config/routes.rb
Rails.application.routes.draw do
  resources :comics, only: [:index] do
    collection do
      get ':page', action: :index
      get 'search', action: :search
    end
  end
end 