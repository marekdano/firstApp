class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts request.env["omniauth.auth"]

    # The method below is implemented the model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts @user.errors.to_a
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      set_flash_message(:alert, :failure, kind: "Facebook", reason: @user.errors.to_a)
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end