source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'activeadmin'
gem 'active_skin'
gem 'faker'
gem 'aasm'
gem 'rails_12factor'
# Bootstrap
gem 'bootstrap', '~> 4.1.3'
# Jquery for bootstrap
gem 'jquery-rails'
# Generate devise views with bootstrap
gem 'devise-bootstrapped'
# HAML compiler
gem "haml"
# Cocoon dynamic nested forms
gem 'cocoon'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'pry-remote'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_bot'

  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development do
  gem 'listen'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'erb2haml'
  gem 'rails-erd', require: false

  gem 'rubocop', '~> 0.46.0', require: false
  gem 'foreman'
  gem 'scss_lint', require: false
  gem 'bullet'
  gem 'better_errors'
end

group :test do
  gem 'simplecov', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
