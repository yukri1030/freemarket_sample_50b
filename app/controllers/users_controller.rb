class UsersController < ApplicationController
  def new
    render layout: 'application-off-header-footer.html.haml'
  end

  def create

  end

  def show
    # @user = User.find(current_user.id)
  end
end
