class Post < ApplicationRecord
  has_rich_text :content

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: { minimum: 5 }

  def post_date
    return self.created_at if self.date.nil?

    self.date
  end
end
