source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg'
gem 'puma'
gem 'active_model_serializers', '~> 0.10.0'
gem 'state_machines'

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'database_cleaner'
end
