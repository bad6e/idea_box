require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:category) { Category.create(name: 'Tech Startups') }
    let(:idea) { Idea.new(name: 'Zipskee', description: 'Tech Startup for Travelers', category_id: category.id) }


  it 'is valid' do
    expect(idea).to be_valid
  end

  it 'is invalid without a name' do
    idea.name = nil
    expect(idea).not_to be_valid
  end

  it 'is invalid without a name' do
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

end
