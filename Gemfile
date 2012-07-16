source "http://rubygems.org"

# Declare your gem's dependencies in blue_velvet.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'turn', '>= 0.9.3'
  gem 'minitest'
  gem 'mini_specunit'
  gem 'mini_shoulda'
  gem 'factory_girl_rails'
  gem 'guard-rails', require: false
  gem 'guard-bundler', require: false
  gem 'guard-jasmine', require: false
  gem 'guard-minitest', require: false
  gem 'rb-fsevent', require: false
end
