source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Use Bootstrap for UI
#gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use font-awesome for icons
gem 'font-awesome-sass', '~> 4.5.0' 
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'angularjs-rails'

# Use devise gem for the user authentication
gem 'devise'

# Use CanCanCan for the user authorization
gem 'cancancan'

# Use will_pagination for splitting the list of something into multiple pages
gem 'will_paginate'

# Use factory_girl to provide factory functionality
gem "factory_girl_rails", "~> 4.0"

# Use mini_magick gem for resizing the uploaded image
gem 'mini_magick'

# Use this gem for uploading any image from a folder to the app
gem 'carrierwave'

# Use fog gem for uploading the images to Amazon S3 
gem 'fog'

# Use stripe for handling the payments
gem 'stripe'

# Use for creating pretty URL’s as if they were numeric ids for ActiveRecord models
gem 'friendly_id', '~> 5.1.0'

# Use redis for caching
gem 'redis-rails'

# Use for omni authentication
gem 'omniauth-facebook'

# Use Gravatar for the logged user's emails
#gem 'gravtastic'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use sqlite3 as the database on the development environment
  gem 'sqlite3'

  # Use RSpec for unit and functional testing
  gem 'rspec-rails', '~> 3.0'

  # Use capybara for acceptance testing 
  gem 'capybara'

  # Use selenium for testing using firefox browser
  gem 'selenium-webdriver'

  # Use gem for clearing down the database
  gem 'database_cleaner'

  # Use Guard-rspec runs RSpec test automatically 
  gem 'guard'

  gem 'guard-rspec', require: false

  # Use Spork speeds up tests
  # Gem not supported in Rails 5
  #gem 'spork-rails'

  # Use gem to talk guard and spork each other
  gem 'guard-spork'

  gem 'rails-controller-testing'
end

group :production do
  # Gem for deploying the app on Heroku  
  gem 'rails_12factor'

  # Use postgreSQL as the database on the production environment
  gem 'pg'
 
  # Use newrelic for monitoring the performance of the app
  gem 'newrelic_rpm'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
