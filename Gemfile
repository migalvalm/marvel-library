source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "bootsnap", require: false
gem 'dotenv-rails'
gem "tailwindcss-rails", "~> 2.0"
gem 'will_paginate', '~> 4.0'



group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'annotate'
end
