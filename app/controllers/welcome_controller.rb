class WelcomeController < ApplicationController
  def index
    if logged_in?
      redirect_to main_publications_path
    end
  end
end
