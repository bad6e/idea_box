require 'rails_helper'

describe 'the user view', type: :feature do

  it "allows a user to be created" do
    visit new_user_path
    fill_in "Username", with: 'Bret'
    fill_in "Password", with: 'password'
    click_button 'Create Account'

    assert page.has_content?("Welcome, Bret")
  end

  it "does not allow a user to be created without a username" do
    visit new_user_path
    fill_in "Username", with: nil
    fill_in "Password", with: 'password'
    click_button "Create Account"

    refute page.has_content?("Welcome, Bret")
    assert page.has_content?("Username can't be blank")
  end

  it "does not allow a user to be created without a password" do
    visit new_user_path
    fill_in "Username", with: "Bret"
    fill_in "Password", with: nil
    click_button "Create Account"

    refute page.has_content?("Welcome, Bret")
    assert page.has_content?("Password can't be blank")
  end

  it "does not allow a user to be created without both a password and username" do
    visit new_user_path
    fill_in "Username", with: nil
    fill_in "Password", with: nil
    click_button "Create Account"

    refute page.has_content?("Welcome, Bret")
    assert page.has_content?("Username can't be blank")
    assert page.has_content?("Password can't be blank")
  end

  it "does not allow duplicate usernames" do
    visit new_user_path
    fill_in "Username", with: 'Bret'
    fill_in "Password", with: 'password'
    click_button 'Create Account'

    assert page.has_content?("Welcome, Bret")

    click_link ("Logout")

    refute page.has_content?("Welcome, Bret")

    visit new_user_path
    fill_in "Username", with: 'Bret'
    fill_in "Password", with: 'password'
    click_button 'Create Account'

    assert page.has_content?("Username has already been taken")
  end
end

