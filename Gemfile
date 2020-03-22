source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'active_model_serializers', '~> 0.10'
gem 'api-pagination'
gem 'cancancan'
gem 'devise'
gem 'devise-async'
gem 'jwt'
gem 'doorkeeper'
gem 'doorkeeper-jwt'
gem 'dry-configurable', '0.9.0'
gem 'kaminari'
gem 'rack-cors'
gem 'rspec-rails', '~> 3.9'
gem 'rswag'
gem "aws-sdk-s3", require: false
gem 'image_processing'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.11.0'
  gem 'faker'
end

group :development do
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-retry'
  gem 'shoulda-matchers'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
