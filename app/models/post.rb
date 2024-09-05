class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, attached: true

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
