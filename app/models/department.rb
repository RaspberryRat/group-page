class Department < ApplicationRecord
  has_many :members

  validates :department, presence: true
end
