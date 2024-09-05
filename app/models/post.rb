class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
