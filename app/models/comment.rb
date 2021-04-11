class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_rich_text :content
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :content, presence: true
end
