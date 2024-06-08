class Member < ApplicationRecord
  belongs_to :position, optional: true
  belongs_to :region
  belongs_to :department
  belongs_to :classification
  belongs_to :subgroup, optional: true

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :department_id, :classification_id, :region_id, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.filter_members(params)
    params = remove_blank_params(params)
    Member.where(params)
  end

  def subgroup_position_check(params)
    return if params.nil? || params.empty?
    debugger
    params[:position_id] = '' if params[:position_id] == 'Not Applicable'
  end

  def subgroup_validation(params)
    debugger
    return if params.nil? || params.empty?

    return true if params[:subgroup_id].empty? || params[:position_id].present?

    false if params[:position_id].blank? && params[:subgroup_id].present?
  end

  private
  def self.remove_blank_params(params)
    params.delete_if { |key, value| value.blank? }
  end
end
