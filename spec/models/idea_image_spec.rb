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
end
