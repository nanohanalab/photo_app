class Photo < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :title, presence: { message: 'を入力してください' }
  validates :image, presence: { message: 'を選択してください' }

  has_one_attached :image
end
