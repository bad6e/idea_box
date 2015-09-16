require 'rails_helper'

describe 'the user view', type: :feature do

  it "allows a user to be created" do
    visit new_user_path
    fill_in "Username", with: 'Bret'
    fill_in "Password", with: 'password'
    click_button 'Create Account'

    assert page.has_content?("Welcome, Bret")
  end
end

