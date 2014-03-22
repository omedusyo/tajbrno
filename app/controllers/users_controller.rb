class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = 'User successfully created'
      redirect_to controller: :articles, action: :index
    else
      render 'signup'
    end
  end

private
  def user_params
    params.require(:user).permit :username,
                                 :password,
                                 :password_confirmation,
                                 :first_name,
                                 :last_name
  end
end
