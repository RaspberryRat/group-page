class Classification < ApplicationRecord
  has_many :members

  validates :classification, presence: true
end
