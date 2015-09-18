class Image < ActiveRecord::Base
  has_many :idea_images
  has_many :ideas, through: :idea_images

  validates :url, presence: true

  def to_s
    url
  end
end
