source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"

# Use sqlite3 as the database for Active Record
gem "pg"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem "activesupport", ">= 6.1.3.1"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-attack"
gem "rack-cors"

# background job gems
gem "sidekiq"
gem "sidekiq-scheduler"

# JSON serialization gems
gem "blueprinter"
gem "oj"
gem "oj_mimic_json"

# misc gems
gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "main"
gem "to_bool", "~> 2.0"

# documentation gems
gem "rswag"

# rSwag Gems
gem "rspec-rails"
gem "rswag-specs"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "byebug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "annotate"
  gem "listen", "~> 3.3"
  gem "spring"

  # used to run stuff within the Procfile
  gem "foreman"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "wdm", ">= 0.1.0" if Gem.win_platform?

# used for API calls to external APIs
gem "faraday"

# for setting up environment variables
gem "figaro"
