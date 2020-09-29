class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  attachment :image
end
