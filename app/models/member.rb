class Member < ApplicationRecord
  belongs_to :position
  belongs_to :region
  belongs_to :department
  belongs_to :classification
  belongs_to :subgroup

  validates :first_name, :last_name, :email, :phone_number, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.filter_members(params)
    params = remove_blank_params(params)
    Member.where(params)
  end
  # def position
  #   return if position_id.nil?
  #   Position.find(self.position_id).role
  # end

  # def region
  #   return if region_id.nil?
  #   Region.find(self.region_id).region
  # end
  #
  # def department
  #   return if department_id.nil?
  #   Department.find(self.department_id).department
  # end
  #
  # def classification
  #   return if classification_id.nil?
  #   Classification.find(self.classification_id).classification
  # end

  # def subgroup
  #   return if self.subgroup_id.nil?
  #   Subgroup.find(self.subgroup_id).subgroup
  # end
  private
  def self.remove_blank_params(params)
    params.delete_if { |key, value| value.blank? }
  end
end
