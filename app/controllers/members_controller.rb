class MembersController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :destroy, :edit, :update]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to members_path, notice: "#{@member.full_name} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if all_filter_params_blank?
      @members = Member.order(:last_name, :first_name)
    else
      @members = Member.filter_members(filter_params)
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to members_path, notice: "#{@member.full_name} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])

    unless current_user.admin?
      return redirect_to members_path, notice: 'You must be an admin to delete a member'
    end

    @member.destroy
    redirect_to members_path, status: :see_other
    flash[:success] = "#{@member.full_name} was successfully deleted."
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone_number,
      :subgroup_id, :steward, :position_id, :department_id, :classification_id, :region_id)
  end

  def filter_params
    params.except(:commit).permit(:subgroup_id, :department_id, :classification_id, :region_id)
  end

  def all_filter_params_blank?
    filter_params.values.all?(&:blank?)
  end
end