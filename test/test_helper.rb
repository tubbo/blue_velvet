# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load test framework gemset
require 'bundler'
Bundler.setup :default, :test

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

require 'vcr'

# Configure HTTP mocking library
VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/cassettes'
  c.hook_into :webmock # or :fakeweb
  # c.allow_http_connections_when_no_cassette = true
end

class ActiveSupport::TestCase
  def refute_blank(attribute)
    refute attribute.blank?, "#{attribute.class.name} is blank."
  end
end
