class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user.nil?
      redirect_to root_path, alert: "User not found."
    end
  end
end
