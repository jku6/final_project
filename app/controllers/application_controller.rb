class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticated_user
  private
  def authenticated_user
    if session[:user_id]
        @auth = User.find(session[:user_id])
    else
        @auth = nil
    end
    rescue ActiveRecord::RecordNotFound
  end
end
