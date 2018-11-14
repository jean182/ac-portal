source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

# App
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

#Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.1.3'
gem 'haml'
gem 'simple_form'
gem 'country_select'

#Views
gem 'devise-bootstrapped'
gem 'cocoon'
gem 'trix-rails', require: 'trix'
gem 'material_icons'

#Authentication and authorization
gem 'devise', '~> 4.2'
gem 'devise_invitable', '~> 1.7.0'
gem 'pundit'

#Mailers
gem 'smtpapi'

gem 'activeadmin'
gem 'active_skin'
gem 'aasm'
gem 'rails_12factor'
gem 'enumerize'
gem 'faker'

# TinyMce
gem 'tinymce-rails'

#annotate
gem 'annotate'
# Font awesome
gem 'font-awesome-rails'

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'pry-remote'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_bot'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen'
  gem 'web-console', '~> 2.0'
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
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
