class Member < ApplicationRecord
  has_one :position

  validates :first_name, :last_name, :email, :region, :phone_number, :department, :subgroup, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
