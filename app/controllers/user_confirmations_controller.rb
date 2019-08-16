class UserConfirmationsController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def edit
  end

  def update
    @user.update(profile_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def profile_params
    params.require(:profile).permit(:zipcode, :address_prefecture, :address_city, :address_street_number, :address_building_name)
  end

  def set_user
    @user = User.find(params[:user_id]).profile
  end
end
