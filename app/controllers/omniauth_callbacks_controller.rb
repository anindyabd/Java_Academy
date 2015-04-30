class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def github 
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   if @user.persisted?
  #     # this will throw if @user is not activated
  #     sign_in_and_redirect @user, :event => :authentication

  #     set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
  #   else
  #     session["devise.github_data"] = request.env["omniauth.auth"]
  #     flash[:notice] = "Couldn't log in. There's some sort of problem..."
  #     redirect_to lessons_path 
  #   end
  # end

    def google_oauth2
     
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        session[:user_id]=@user.id
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        flash[:notice] = "Couldn't log in. There's some sort of problem..."
        redirect_to lessons_path
      end
  end

end
