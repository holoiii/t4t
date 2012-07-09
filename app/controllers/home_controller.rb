class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    redirect_to dashboard_path if current_user
  end
end
