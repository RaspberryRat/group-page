class Member < ApplicationRecord
  belongs_to :position

  validates :first_name, :last_name, :email, :region, :phone_number, :department, :subgroup, presence: true
end
