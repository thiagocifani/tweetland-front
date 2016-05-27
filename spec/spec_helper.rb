ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require 'rspec/collection_matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/spec_helpers/*.rb")].each { | f| require f }

RSpec.configure do |config|
  require "database_cleaner"
  require "capybara/rails"
  require "factory_girl"
  require "pry"
  require 'webmock/rspec'
  require 'vcr'

  VCR.configure do |c|
    c.ignore_localhost = true
    c.cassette_library_dir = File.expand_path("fixtures/vcr_cassettes", __dir__)
    c.hook_into :webmock
  end

  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end

  config.filter_run_excluding broken: true

  Capybara.configure do |c|
    c.always_include_port = true
    c.javascript_driver   = :selenium
  end


  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.javascript_driver = :chrome
end
