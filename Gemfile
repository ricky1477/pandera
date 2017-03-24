source 'https://rubygems.org'

#ruby '2.2.5'
#ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Twitter Bootstrap gem
gem "therubyracer"
gem "less-rails"
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

# Authentication gem
gem 'devise'

# Pagination gem
gem 'will_paginate', '~> 3.0.6'

# I18n gem
gem 'rails-i18n'

# Carrierwave for image manipulation
gem 'carrierwave'#, '>= 1.0.0.beta', '< 2.0'
# Dropbox for image hosting
gem 'carrierwave-dropbox'

# Hiding secrets
gem 'figaro'

# Stripe for payments
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'byebug'
    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
    gem 'spring-commands-rspec'
    gem 'spring-commands-cucumber'
    # RSpec
    gem 'rspec-rails'
    gem 'factory_girl_rails'
end

group :test do
    gem 'capybara'
    gem 'cucumber-rails', require: false
    gem 'database_cleaner'
    gem 'poltergeist', '~> 1.11'
    gem 'selenium-webdriver', '~> 2.48', '>= 2.48.1'
    gem 'shoulda-matchers', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

end

group :production do
  gem 'rails_12factor', group: :production
end

