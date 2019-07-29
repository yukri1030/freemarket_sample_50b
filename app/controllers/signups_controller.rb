class SignupsController < ApplicationController
  layout 'application-off-header-footer'

  def sms_confirmation_send
    @profile = Profile.new
    flash.delete(:notice)
  end

  def sms_confirmation_certify
    @profile = current_user.profile.assign_attributes(profile_params)
    if current_user.profile.valid?(:sms_confirmation_send)
      current_user.profile.update(profile_params)
    else
      @profile = Profile.new
      @errors = '未記入箇所があります'
      render 'sms_confirmation_send'
    end
  end

  def address
    
  end

  def address_create
    @profile = current_user.profile.assign_attributes(profile_params)
    if current_user.profile.valid?(:hoge)
      current_user.profile.update(profile_params)
    else
      @profile = current_user.profile
      @errors = '未記入箇所があります'
      render 'address'
    end
    case params[:move_from]
      when 'signup'
        redirect_to new_user_card_path(current_user.id)
      when 'purchase'
        redirect_to new_product_purchase_path(params[:product_id])
    end
  end

  def new

  end
  def show

  end
  def successful

  end

  private

  def profile_params
    params.require(:profile).permit(:phone_number,:family_name, :last_name, :family_name_kana, :last_name_kana, :zipcode, :address_prefecture, :address_city, :address_street_number,:address_building_name)
  end

  def use_check_address_nil?
    false
  end
 end