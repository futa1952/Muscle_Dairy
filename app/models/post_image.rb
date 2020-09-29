class PostImage < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :menu, presence: true
  validates :title, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  private
  def post_image_params
    params.require(:post_image).permit(:image)
  end
end
