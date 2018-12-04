class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def require_logged_in
    unless current_user
      flash[:notice] = "You need to be logged in to do that."
      redirect_to(controller: 'sessions', action: 'new')
    end
  end
end
