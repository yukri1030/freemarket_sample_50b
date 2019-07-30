class Users::RegistrationsController < Devise::RegistrationsController
  layout 'application-off-header-footer'

  def new
    @user = User.new
    @profile = @user.build_profile
    session["devise.facebook_data"] = nil
    session["devise.google_data"] = nil
  end

  def create
    super
    if User.new(configure_permitted_parameters)&&verify_recaptcha(model: resource)
    else
      build_resource(sign_up_params)
      @profile = @user.profile
      @errors='未記入箇所があります'
      render 'new' and return
    end
  end

  def after_sign_up_path_for(resource)
    signup_sms_confirmation_path
  end
end