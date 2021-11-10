class User < ApplicationRecord
  has_many :photos
  validates :uid, presence: true
  has_secure_password
end
