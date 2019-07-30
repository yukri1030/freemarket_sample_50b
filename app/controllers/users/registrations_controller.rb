class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_captcha, only: [:create]
  layout 'application-off-header-footer'

  def new
    @user = User.new
    @profile = @user.build_profile
    session["devise.facebook_data"] = nil
    session["devise.google_data"] = nil
  end

  # POST /resource
  def create
    if User.profile_nested_with_user_is_valid?(params)
      super and return
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

  private

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      render :new
    end
  end
end
