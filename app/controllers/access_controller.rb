class AccessController < ApplicationController
  def login
    @user = User.new
  end

  def attempt_login
    authorized_user = false
    user = params[:user]
    # checking if username/password are provided
    if user[:username].present? and user[:password].present?
      # searching for user in db
      found_user = User.where(username: user[:username]).first
      if found_user
        # checking user's password
        authorized_user = found_user.authenticate user[:password]
      end

      if authorized_user
        session[:user_id] = authorized_user.id
        redirect_to controller: :articles, action: :index
      else
        flash[:alert] = 'Username/password combination is invalid.'
        redirect_to action: :login
      end
    else
      flash[:alert] = 'You need to provide both username and password.'
      redirect_to action: :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: :login
  end
end
