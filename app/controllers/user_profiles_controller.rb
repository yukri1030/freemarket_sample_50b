class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_params

  def new
    render layout: 'application-off-header-footer.html.haml'
  end

  def create
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_param)
  end

  private

  def profile_param
    params.require(:profile).permit(:nickname, :profile_comment)
  end
end
