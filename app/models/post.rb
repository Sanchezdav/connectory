class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title, :content, presence: true

  scope :latest, -> { order(created_at: :desc) }
end
