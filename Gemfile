source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'dotenv-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'redis'
gem 'resque'
gem 'httparty'
gem 'rufus-scheduler'
gem 'after_commit_everywhere'
gem 'tzinfo-data'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'foreman', require: false
end
