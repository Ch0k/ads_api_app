source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.6'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'bcrypt'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'fast_jsonapi'
gem 'pg'
gem 'jwt', '~> 2.2.1'
gem 'kaminari', '~> 1.2.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.9.0'
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'database_cleaner-active_record', '~> 1.8.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
