class User < ApplicationRecord
  validates :user_id, presence: true

  has_secure_password
end
