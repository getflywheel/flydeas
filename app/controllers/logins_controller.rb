class LoginsController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    @user.encrypt_password
    if @user.save
      #binding.pry
      #flash[:info] = "Woo you signed up"
      #flash[:color] = "valid"
      UserMailer.account_activation(@user).deliver_now
      #binding.pry
      #redirect_to new_login_url
      flash[:sucess] = "Please check your email to activate your account."
	    #format.html { redirect_to (@user, :notice => 'User was successfully created.') }
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end
  def confirm_email
    user = User.find_by_activation_digest(params[:id])
    if user
      user.email_activate
      flash[:sucess] = "Welcome to Flydeas! Your email has been confirmed!!"
      #TODO Uncomment this when completed with session control
      redirect_to new_login_url
    else
      flash[:error] = "Sorry, User does not exist"
      #TODO uncomment this when a homepage is implemented
      #redirect_to root_url
    end
  end
  private
  def user_params
     params.require(:user).permit(:username, :email, :password)
  end
end
