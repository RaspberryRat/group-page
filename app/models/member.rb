class Member < ApplicationRecord
  belongs_to :position, optional: true
  belongs_to :region
  belongs_to :department
  belongs_to :classification
  belongs_to :subgroup, optional: true
  belongs_to :executive, optional: true

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :department_id, :classification_id, :region_id, presence: true
  validate :subgroup_requires_position
  validate :position_requires_subgroup

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.filter_members(params)
    params = remove_blank_params(params)
    Member.where(params)
  end

  def subgroup_position_check(params)
    return if params.nil? || params.empty?
    params[:position_id] = '' if params[:position_id] == 'None'
    params[:subgroup_id] = '' if params[:subgroup_id] == 'None'
    params[:executive_id] = '' if params[:executive_id] == 'None'
  end

  def role
    self.position.role
  end

  private
  def self.remove_blank_params(params)
    params.delete_if { |key, value| value.blank? }
  end

  def subgroup_requires_position
    if subgroup_id.present? && position_id.blank?
      errors.add(:position_id, "must be chosen if subgroup is chosen.") unless subgroup.name == 'None'
    end
  end

  def position_requires_subgroup
    if position_id.present? && subgroup_id.blank?
      errors.add(:subgroup_id, "must be chosen if a position is chosen.") unless position.role == 'None'
    end
  end
end
