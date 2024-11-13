class ActivityController < ApplicationController
  before_action :authenticate_user!
  before_action :check_super_user_role

  def index
    @activities = Activity.all
  end

  private
  def check_super_user_role
    unless current_user.super_user == true
      redirect_to root_path, 'Alert, you are not authorized to access this page'
    end
  end
end
