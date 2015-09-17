class Idea < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :name, :description, :category_id, presence: true
end
