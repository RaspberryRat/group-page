class Executive < ApplicationRecord
  has_many :members

  validates :role, presence: true
end
