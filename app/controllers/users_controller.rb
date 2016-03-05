class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to articles_path, notice: 'User successfully created'
    else
      render action: :new
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
