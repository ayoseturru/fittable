class SessionsController < ApplicationController
  def create
    if user= User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to exercises_url
    else
      flash[:error] = "Lo sentimos. Las crecendiales proporcionadas no son corectas..."
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end