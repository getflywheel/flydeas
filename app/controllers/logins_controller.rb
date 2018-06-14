class LoginsController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    @user.encrypt_password
    if @user.save
      flash[:info] = "Woo you signed up"
      #flash[:color] = "valid"
      UserMailer.account_activation(@user).deliver_now
	  flash[:info] = "Please check your email to activate you account."
	  redircect_to(@user, :notice => 'user created')
	  format.html { redirect_to @user, notice: 'User was successfully created.' }
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
