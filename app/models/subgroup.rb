class Subgroup < ApplicationRecord
  has_many :members

  validates :subgroup, presence: true
end
