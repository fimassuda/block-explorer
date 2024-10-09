require "application_system_test_case"

class ActionsTest < ApplicationSystemTestCase
  setup do
    @action = actions(:one)
  end

  test "visiting the index" do
    visit actions_url
    assert_selector "h1", text: "Actions"
  end

  test "should create action" do
    visit actions_url
    click_on "New action"

    fill_in "Deposit", with: @action.deposit
    fill_in "Gas", with: @action.gas
    fill_in "Method name", with: @action.method_name
    fill_in "Type", with: @action.action_type
    click_on "Create Action"

    assert_text "Action was successfully created"
    click_on "Back"
  end

  test "should update Action" do
    visit action_url(@action)
    click_on "Edit this action", match: :first

    fill_in "Deposit", with: @action.deposit
    fill_in "Gas", with: @action.gas
    fill_in "Method name", with: @action.method_name
    fill_in "Type", with: @action.action_type
    click_on "Update Action"

    assert_text "Action was successfully updated"
    click_on "Back"
  end

  test "should destroy Action" do
    visit action_url(@action)
    click_on "Destroy this action", match: :first

    assert_text "Action was successfully destroyed"
  end
end
