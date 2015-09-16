require 'rails_helper'

describe 'the user view', type: :feature do
  let(:user) { User.create(username: 'Bret', password: 'himom')}

  it "allows a logged in user to logout" do

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: 'himom'
    click_button "Login"

    assert page.has_content?("Welcome, Bret")

    click_link ("Logout")

    refute page.has_content?("Welcome, Bret")
  end
end