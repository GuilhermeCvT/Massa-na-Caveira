require "test_helper"

class EntrancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrance = entrances(:one)
  end

  test "should get index" do
    get entrances_url
    assert_response :success
  end

  test "should get new" do
    get new_entrance_url
    assert_response :success
  end

  test "should create entrance" do
    assert_difference("Entrance.count") do
      post entrances_url, params: { entrance: { description: @entrance.description } }
    end

    assert_redirected_to entrance_url(Entrance.last)
  end

  test "should show entrance" do
    get entrance_url(@entrance)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrance_url(@entrance)
    assert_response :success
  end

  test "should update entrance" do
    patch entrance_url(@entrance), params: { entrance: { description: @entrance.description } }
    assert_redirected_to entrance_url(@entrance)
  end

  test "should destroy entrance" do
    assert_difference("Entrance.count", -1) do
      delete entrance_url(@entrance)
    end

    assert_redirected_to entrances_url
  end
end
