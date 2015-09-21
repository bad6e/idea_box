class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :ideas


  has_secure_password

  enum role: ["default", "admin"]
end
