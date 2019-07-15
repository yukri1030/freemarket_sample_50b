class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  user = Rails.application.credentials.basic_auth[:user]
  pw = Rails.application.credentials.basic_auth[:password]

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == user && password == pw
    end
  end
end
