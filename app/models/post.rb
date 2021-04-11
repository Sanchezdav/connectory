class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true

  scope :latest, -> { order(created_at: :desc) }
  scope :popular, -> { order(likes_count: :desc) }

  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user.id }
  end
end
