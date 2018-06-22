class LoginsController < ApplicationController
  def new
    @user = User.new 
  end

  #Creates a User (add to DB)
  def create
    @user = User.new(user_params)
    @user.create_salt
    @user.encrypt_password
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      #TODO make a homepage, redirct users after signup
      flash[:sucess] = "Please check your email to activate your account."
      log_in @user
      redirect_to root_url

    else
        flash[:notice] = "Form is invalid"
        render "new"
    end
    
  end

  private
  def user_params
     params.require(:user).permit(:username, :email, :password)
  end
end
