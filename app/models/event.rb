class Event < ApplicationRecord
  has_rich_text :description
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Time.now)}
  scope :future, -> { where("date > ?", Time.now)}
end
