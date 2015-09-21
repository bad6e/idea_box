require 'rails_helper'

describe 'the user view', type: :feature do
  let(:user) { User.create(username: 'Bret', password: 'himom')}

  it "allows a logged in user to logout" do

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: 'himom'
    click_button "Login"

    assert page.has_content?("List of Categories for Bret")

    click_link ("Logout")

    refute page.has_content?("List of Categories for Bret")
  end
end