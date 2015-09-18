class IdeaImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :idea

  validates :image_id, :idea_id, presence: true
end
