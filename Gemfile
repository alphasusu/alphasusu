source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.2'

# Backend
gem 'devise'                        # Authentication
gem 'devise_ldap_authenticatable'   # LDAP Authentication
gem "paperclip", "~> 3.5.2"         # File uploads/attachments
gem "cancan"                        # Permissions/Authorization
gem 'friendly_id'                   # Slugs for IDs
gem 'jbuilder', '~> 1.2'            # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'nokogiri'


# Asset Pipeline
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'          # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'      # Use CoffeeScript for .js.coffee assets and views


# Client Side
gem 'jquery-rails'                  # Because jquery
gem 'leaflet-rails'                 # Leaflet for mapping
gem 'foundation-rails'              # Foundation for CSS
gem 'socket.io-rails'               # Socket.IO


group :development do
  gem 'meta_request'                # Debugging metrics in Rails Console for Chrome
  gem 'sqlite3'                     # Instead of Postgres in development
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'tconsole'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'                          # Postgres for Production, on Heroku
  # gem 'unicorn'                   # Use unicorn as the app server
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
