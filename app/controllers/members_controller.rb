class MembersController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :destroy]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to members_path, notice: 'Memeber successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
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
    params.require(:member).permit(:first_name, :last_name, :email, :region, :phone_number, :department,
      :classification, :subgroup, :steward)
  end

end
