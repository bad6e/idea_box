require 'rails_helper'

RSpec.describe IdeaImage, type: :model do
  let(:user) { User.create(username: 'bad6e', password: 'himom')}
    let(:category) { Category.create(name: 'Tech Startups') }
      let(:idea) { Idea.create(name: 'Zipskee', description: 'Tech Startup for Travelers', category_id: category.id, user_id: user.id) }
        let(:image) { Image.create(url: 'www.example.com')}
          let(:idea_images) {IdeaImage.create(image_id: image.id, idea_id: idea.id)}

  it 'is valid' do
    expect(idea_images).to be_valid
  end

  it 'is invalid without an image_id and must reference an image' do
    idea_images.image_id = nil
    expect(idea_images).not_to be_valid
  end

  it 'is invalid without an idea_id and must reference an idea' do
    idea_images.idea_id = nil
    expect(idea_images).not_to be_valid
  end
end
