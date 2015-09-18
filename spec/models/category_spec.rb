require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) do
    Category.new(name: 'Tech Startups')
  end

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is invalid over 25 characters' do
    category.name = "abcdefghijklmnopqrstuvwxyz"
    expect(category).to_not be_valid
  end

  it "must have a reference to an idea" do
    category.ideas.build(name: 'Zipskee', description: 'People')
    expect(category.ideas.map(&:name)).to eq(['Zipskee'])
    expect(category.ideas.map(&:description)).to eq(['People'])
  end
end