class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def readable_time
    timestamp.strftime('%Y-%m-%d %H:%M')
  end
end
