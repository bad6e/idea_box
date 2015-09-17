require 'rails_helper'

describe 'the admin view', type: :feature do
  let(:user) { User.create(username: 'admin', password: "password", role: 1)}

  it 'allows a admin to see the category index' do
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    visit admin_categories_path
    expect(page).to have_content("All Categories")
    assert page.has_content?("All Categories")
  end
end
