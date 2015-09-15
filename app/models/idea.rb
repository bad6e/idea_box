class Idea < ActiveRecord::Base
  belongs_to :category
  validates :name, :description, :category_id, presence: true
end
