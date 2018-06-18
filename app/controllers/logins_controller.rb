class LoginsController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    @user.encrypt_password
    if @user.save
      flash[:notice] = "Woo you signed up"
      flash[:color] = "valid"
      log_in @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end

  private
  def user_params
     params.require(:user).permit(:username, :email, :password)
  end
end
