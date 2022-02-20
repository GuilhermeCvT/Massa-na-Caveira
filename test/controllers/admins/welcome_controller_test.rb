require "test_helper"

class Admins::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_welcome_index_url
    assert_response :success
  end
end
