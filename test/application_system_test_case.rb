# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  include Warden::Test::Helpers

  setup { login_as users(:one), scope: :user }
  teardown { Warden.test_reset! }
end
