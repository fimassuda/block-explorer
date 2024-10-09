require "application_system_test_case"

class BlockchainsTest < ApplicationSystemTestCase
  setup do
    @blockchain = blockchains(:one)
  end

  test "visiting the index" do
    visit blockchains_url
    assert_selector "h1", text: "Blockchains"
  end

  test "should create blockchain" do
    visit blockchains_url
    click_on "New blockchain"

    fill_in "Endpoint", with: @blockchain.endpoint
    fill_in "Name", with: @blockchain.name
    click_on "Create Blockchain"

    assert_text "Blockchain was successfully created"
    click_on "Back"
  end

  test "should update Blockchain" do
    visit blockchain_url(@blockchain)
    click_on "Edit this blockchain", match: :first

    fill_in "Endpoint", with: @blockchain.endpoint
    fill_in "Name", with: @blockchain.name
    click_on "Update Blockchain"

    assert_text "Blockchain was successfully updated"
    click_on "Back"
  end

  test "should destroy Blockchain" do
    visit blockchain_url(@blockchain)
    click_on "Destroy this blockchain", match: :first

    assert_text "Blockchain was successfully destroyed"
  end
end
