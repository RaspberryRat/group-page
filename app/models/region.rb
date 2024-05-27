class Region < ApplicationRecord
  has_many :members

  validates :region, presence: true
end
