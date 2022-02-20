require "application_system_test_case"

class EntrancesTest < ApplicationSystemTestCase
  setup do
    @entrance = entrances(:one)
  end

  test "visiting the index" do
    visit entrances_url
    assert_selector "h1", text: "Entrances"
  end

  test "should create entrance" do
    visit entrances_url
    click_on "New entrance"

    fill_in "Description", with: @entrance.description
    click_on "Create Entrance"

    assert_text "Entrance was successfully created"
    click_on "Back"
  end

  test "should update Entrance" do
    visit entrance_url(@entrance)
    click_on "Edit this entrance", match: :first

    fill_in "Description", with: @entrance.description
    click_on "Update Entrance"

    assert_text "Entrance was successfully updated"
    click_on "Back"
  end

  test "should destroy Entrance" do
    visit entrance_url(@entrance)
    click_on "Destroy this entrance", match: :first

    assert_text "Entrance was successfully destroyed"
  end
end
