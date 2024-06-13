class Post < ApplicationRecord
  has_rich_text :content


  def post_date
    return self.created_at if self.date.nil?

    self.date
  end
end
