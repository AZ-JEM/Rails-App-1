source 'https://rubygems.org'

# foundation
ruby '2.5.1'

# framework
gem 'rails', '~> 5.2.1'

# version control
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# no-turbo
# gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do

  # Exercise 6.1 : Unit tests
  gem 'rspec-rails', '~> 3.7'

  # Exercise 6.2 : Functional tests
  # *** controller specs are discouraged as of v3.5 ***
  # *** request specs are recommended ***
  gem 'rails-controller-testing'

  # Exercise 6.4
  gem "factory_bot_rails", "~> 4.0"
  gem "faker"

  # development RDBMS
  gem 'sqlite3'

  # Exercise 6.7 -------------------------------------------------- /
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # add REPL with binding.pry
  gem 'pry-byebug'
  # --------------------------------------------------------------- /

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Exercise 3.10
# RDBMS assignments
group :production do
  gem 'pg', '~>0.20'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Authentication...
gem 'devise', '~> 4.4', '>= 4.4.3'

# Authorization
gem 'cancancan'

# Pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Payment acceptance
gem 'stripe'

# Security audits
gem 'brakeman'

# Caching
gem 'dalli'
gem 'connection_pool'

gem 'redis-rails'

# APM
gem 'newrelic_rpm'
