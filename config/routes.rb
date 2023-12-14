# config/routes.rb
Rails.application.routes.draw do
  resources :comics, only: [:index] do
    collection { get ':page' => 'comics#index' }
  end 
end 