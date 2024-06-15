class Event < ApplicationRecord
  has_rich_text :description
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now).order(:date).limit(6) }


  # Method needed because requirements in simple calendar gem
  def start_time
    self.date
  end
end
