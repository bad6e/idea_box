class Idea < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :idea_images
  has_many :images, through: :idea_images

  validates :name, :description, :category_id, presence: true


  def url_list
    images.join(", ")
  end

  def url_list=(url_string)
    url_names = url_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_images = url_names.collect { |url| Image.find_or_create_by(url: url) }
    self.images = new_or_found_images
  end
end