class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # to use this actions user needs to be logged in
  USERS_ACTIONS = [
    :new, :create,
    :edit, :update,
    :destroy
  ]

protected
  def current_user
    User.find session[:user_id]
  end

private
  def confirm_logged_in
    if session[:user_id]
      return true
    else
      flash[:alert] = 'Please log in.'
      redirect_to controller: :access, action: :login
      return false
    end
  end
end
