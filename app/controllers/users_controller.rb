class UsersController < ApplicationController


  def signup
    @user = User.new
  end

  def create
    @user = User.new user_params.merge( access_rights: initial_rights)
    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to controller: :access, action: :login
    else
      acknowledge_errors @user
      render 'signup'
    end
  end

  def options
    @user = current_user
  end

  def update
    @user = current_user

    data = params[:user]
    @user.first_name = data[:first_name]
    @user.last_name  = data[:last_name]
    if @user.save
      flash[:notice] = "User's name updated successfully"
      redirect_to action: :options
    else
      acknowledge_errors @user
      render 'options'
    end
  end

private
  # 00000
  def initial_rights
    '0'*5
  end

  def user_params
    params.require(:user).permit :username,
                                 :password,
                                 :password_confirmation,
                                 :first_name,
                                 :last_name
  end
end
