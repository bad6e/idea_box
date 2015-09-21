require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:category) { Category.create(name: 'Tech Startups') }
    let(:user) { User.create(username: 'bad6e', password: 'himom')}
      let(:idea) { Idea.new(name: 'Zipskee', description: 'Tech Startup for Travelers', category_id: category.id, user_id: user.id) }

  it 'is valid' do
    expect(idea).to be_valid
  end

  it 'is invalid without a name' do
    idea.name = nil
    expect(idea).not_to be_invalid
  end

  it 'is invalid without a description' do
    idea.description = nil
    expect(idea).not_to be_valid
  end

  it 'must reference a category' do
    idea.category_id = nil
    expect(idea).to_not be_valid
  end

  it 'is associated with a category' do
    expect(idea).to respond_to(:category)
  end

  it 'must reference a user' do
    idea.user_id = nil
    expect(idea).to_not be_valid
  end

  it 'is associated with a user' do
    expect(idea).to respond_to(:user)
  end

  it 'must reference an image' do
    idea.images.build(url: 'www.example.com')
    expect(idea.images.map(&:url)).to eq(['www.example.com'])
  end

  it 'is assocated with an idea_image' do
    expect(idea).to respond_to(:idea_images)
  end
end
