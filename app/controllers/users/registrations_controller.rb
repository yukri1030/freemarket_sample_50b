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
    User.new(configure_permitted_parameters)&&verify_recaptcha(model: resource)
    @user.save
    return
  end

  def after_sign_up_path_for(resource)
    signup_sms_confirmation_path
  end
end