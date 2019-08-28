class UserProfilesController < ApplicationController
  before_action :authenticate_user!

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
    if @profile.update(profile_param)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private

  def profile_param
    params.require(:profile).permit(:nickname, :profile_comment)
  end
end
