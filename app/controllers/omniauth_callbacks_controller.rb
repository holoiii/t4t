class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_or_initialize_by_uid(request.env["omniauth.auth"]["uid"])

    if @user.persisted?
      flash[:success] = "Successfully signed in!"
    else
      @user.uid = request.env["omniauth.auth"]["uid"]
      @user.provider = request.env["omniauth.auth"]["provider"]
      @user.auth_info = request.env["omniauth.auth"]
      @user.save!
      flash[:success] = "Successfully signed up!"
    end
    sign_in @user
    redirect_to dashboard_url
  end
end
