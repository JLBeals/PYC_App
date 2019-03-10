class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  scope :rating_desc, -> {order(rating: :desc)}
  scope :rating_asc, -> {order(rating: :asc)}
end
