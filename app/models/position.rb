class Position < ApplicationRecord
  has_many :members

  validates :role, presence: true
end
