class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_super_user_role

  def index
    @activities = Activity.all
  end

  private
  def check_super_user_role
    unless current_user.super_user?
      flash[:alert] = "Access denied. Super user access is required."
      redirect_to root_path, status: :forbidden
    end
  end
end
