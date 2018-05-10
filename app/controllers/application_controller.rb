class ApplicationController < ActionController::Base
  before_action :authorize

  private

  def authorize
    return if action_name == 'sign_in'
    redirect_to sign_in_users_path unless sign_in?
  end

  def sign_in?
    session[:current_user].present?
  end

  def current_user
    @current_user ||= User.new(session[:current_user])
  end
end
