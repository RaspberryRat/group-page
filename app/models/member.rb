class Member < ApplicationRecord
  has_one :position
  has_one :region
  has_one :department
  has_one :classification

  validates :first_name, :last_name, :email, :phone_number, :subgroup, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def position
    Position.find(self.position_id).role
  end

  def region
    Region.find(self.region_id).region
  end

  def department
    Department.find(self.department_id).department
  end

  def classification
    Classification.find(self.classification_id).classification
  end
end
