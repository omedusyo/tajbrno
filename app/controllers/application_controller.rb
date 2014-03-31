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

  def acknowledge_errors resource
    flash[:errors] = resource.errors.full_messages
  end

private
  def do_authentication
    confirm_logged_in and confirm_access
  end

  def confirm_access
    if current_user.has_access? controller_name.to_sym
      return true
    else
      redirect_to controller: :access, action: :denied
      return false
    end
  end

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
