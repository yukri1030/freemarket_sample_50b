class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :check_captcha, only: [:create]
  layout 'application-off-header-footer'

  def new
    @user = User.new
    @profile = @user.build_profile
    session["devise.facebook_data"] = nil
    session["devise.google_data"] = nil
  end

  def create
    super
    unless User.new(configure_permitted_parameters)
      build_resource(sign_up_params)
      @profile = @user.profile
      @errors='未記入箇所があります'
    end
  end

  def after_sign_up_path_for(resource)
    signup_sms_confirmation_path
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,profile_attributes: [:family_name, :last_name,:family_name_kana,:last_name_kana,:birth_ymd,:user_id]])
  end
  
  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      render :new
    end
  end
end
