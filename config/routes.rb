# config/routes.rb
Rails.application.routes.draw do
  resources :comics, only: [:index]
 end 