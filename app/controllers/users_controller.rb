class UsersController < ApplicationController

  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

  def set_user
    @user = current_user
  end
end
