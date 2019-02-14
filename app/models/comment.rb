class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  @product.comments.rating_desc.first %>
end
