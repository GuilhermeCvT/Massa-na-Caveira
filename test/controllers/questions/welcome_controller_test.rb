require "test_helper"

class Questions::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_welcome_index_url
    assert_response :success
  end
end
