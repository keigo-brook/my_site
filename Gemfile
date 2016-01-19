source 'https://rubygems.org'


gem 'rails', '4.2.1'
gem 'sqlite3', group: :development
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'
gem 'bootstrap-sass'
gem 'font-awesome-rails'

group :production, :staging do
  gem 'unicorn'
  gem 'mysql2'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

