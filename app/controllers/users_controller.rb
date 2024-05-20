class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :update, :edit]

  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])

    if @user.nil?
      redirect_to root_path, alert: "User not found."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if user_params.include?(:admin) && @user == current_user
      redirect_to users_path, notice: 'Cannot change admin status of signed in user'
      return
    end

    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :poster)
  end
end
