class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  #Creates a User (add to DBe)
  def create
    @user = User.new(user_params)
    @user.encrypt_password
    @user.create_activation_digest
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      #TODO make a homepage, redirct users after signup
      #redirect_to new_login_url
      flash[:sucess] = "Please check your email to activate your account."
      flash[:notice] = "Woo you signed up"
      flash[:color] = "valid"
      log_in @user
    else
      flash[:notice] = "Form is invalid"
    end
    render "new"
  end

  private
  def user_params
     params.require(:user).permit(:username, :email, :password)
  end
end
