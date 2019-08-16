class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :check_captcha, only: [:create]
  layout 'application-off-header-footer'

  def new
    @user = User.new
    @profile = @user.build_profile
    session["devise.facebook_data"] = nil
    session["devise.google_data"] = nil
  end

  def create
    if User.profile_nested_with_user_is_valid?(params)&&verify_recaptcha(model: resource)
       super and return
    else
      @user = build_resource(sign_up_params)
      @profile = @user.profile
      @errors='未記入箇所があります'
      render 'new' and return
    end
  end

  def after_sign_up_path_for(resource)
    signup_sms_confirmation_path
  end
end
