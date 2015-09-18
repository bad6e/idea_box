require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { Image.create(url: 'www.example.com')}

  it 'is valid' do
    expect(image).to be_valid
  end

  it "is invalid without a url" do
    image.url = nil
    expect(image).to_not be_valid
  end

  it "must reference an idea" do
    image.ideas.build(name: 'A', description: 'B')
    expect(image.ideas.map(&:name)).to eq(['A'])
    expect(image.ideas.map(&:description)).to eq(['B'])
  end

  it "is associated with an idea_image" do
    expect(image).to respond_to(:idea_images)
  end
end
