require "application_system_test_case"

class TokensTest < ApplicationSystemTestCase
  setup do
    @token = tokens(:one)
  end

  test "visiting the index" do
    visit tokens_url
    assert_selector "h1", text: "Tokens"
  end

  test "creating a Token" do
    visit tokens_url
    click_on "New Token"

    fill_in "List", with: @token.list_id
    fill_in "Name", with: @token.name
    fill_in "Value", with: @token.value
    click_on "Create Token"

    assert_text "Token was successfully created"
    click_on "Back"
  end

  test "updating a Token" do
    visit tokens_url
    click_on "Edit", match: :first

    fill_in "List", with: @token.list_id
    fill_in "Name", with: @token.name
    fill_in "Value", with: @token.value
    click_on "Update Token"

    assert_text "Token was successfully updated"
    click_on "Back"
  end

  test "destroying a Token" do
    visit tokens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Token was successfully destroyed"
  end
end
