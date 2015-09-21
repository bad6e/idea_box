require 'rails_helper'

describe 'the user view', type: :feature do
  let(:user) { User.create(username: 'Bret', password: 'himom')}

  it "allows a registered user to log in" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: 'himom'
    click_button "Login"

    assert page.has_content?("List of Categories for Bret")
  end

  it "does not allow a non-registered user to log in" do
    visit login_path
    fill_in "Username", with: "Tom"
    fill_in "Password", with: "Hi"
    click_button "Login"

    refute page.has_content?("List of Categories for Bret")
  end

  it "does not allow a user to leaves all the fields blank" do
    visit login_path
    fill_in "Username", with: nil
    fill_in "Password", with: nil
    click_button "Login"

    refute page.has_content?("Welcome, Tom")
    assert page.has_content?("Invalid Login")
  end
end