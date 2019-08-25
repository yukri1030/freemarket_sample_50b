class UserProfilesController < ApplicationController
  def new
    render layout: 'application-off-header-footer.haml'
  end

  def create
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
  end
end
