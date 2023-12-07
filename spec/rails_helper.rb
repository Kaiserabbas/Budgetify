require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'webdrivers'
Webdrivers::Chromedriver.required_version = '114.0.5735.90'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

  RSpec.configure do |config|
  config.fixture_path = "#{Rails.root}/spec/fixtures"
  config.include Devise::Test::ControllerHelpers, type: :view

  config.use_transactional_fixtures = true

   config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.before(:each, type: :system) do
    driven_by :rack_test
    Rails.application.reload_routes!

  end
end
Capybara.default_driver = :selenium_chrome
