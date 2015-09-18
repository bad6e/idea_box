require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'Bret', password: 'Himom')}

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "must have a reference to an idea" do
    user.ideas.build(name: 'Zipskee', description: 'People')
    expect(user.ideas.map(&:name)).to eq(['Zipskee'])
    expect(user.ideas.map(&:description)).to eq(['People'])
  end

  it "must have a default role" do
    user.role = 0
    expect(user.role).to eq('default')
  end
end


