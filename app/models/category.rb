class Category < ActiveRecord::Base
  has_many :ideas
  validates :name, presence: true, length: {maximum: 25}
end
