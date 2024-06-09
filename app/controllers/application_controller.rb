class ApplicationController < ActionController::Base
  before_action :sign_out_user_if_pending

  protected
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, status: :forbidden unless current_user.admin?
  end

  private

  def sign_out_user_if_pending
    sign_out(current_user) if current_user && !current_user.approve?
  end
end
