# Code coverage
require 'coveralls'
Coveralls.wear!

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    #
    # Note: You'll currently still have to declare fixtures explicitly in integration tests
    # -- they do not yet inherit this setting
    fixtures :all

    def as_nobody
        # Placeholder, so that a method can still be called for documentation
        # inside tests.
    end

    def as_user
        @request.env["devise.mapping"] = Devise.mappings[:local_user]
        user = FactoryGirl.create(:local_user)
        user.confirm!
        sign_in :local_user, user
    end

    def as_admin
        @request.env["devise.mapping"] = Devise.mappings[:local_user]
        admin = FactoryGirl.create(:local_admin)
        admin.confirm!
        sign_in :local_user, admin
    end
end

class ActionController::TestCase
    include Devise::TestHelpers
end
