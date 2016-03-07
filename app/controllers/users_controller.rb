class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :destroy, :edit]

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: '¡Inicia sesion para empezar a usar FitTable!'
    else
      render action: :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to exercises_url, notice: 'User successfully updated'
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :username, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
