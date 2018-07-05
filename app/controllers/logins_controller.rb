class LoginsController < ApplicationController
	def new
		@user = User.new
	end

	# Creates a User (add to DB)
	def create
		@user = User.new(user_params)
		@user.create_salt
		@user.encrypt_password
		@user.create_activation_digest
		if @user.save
			UserMailer.account_activation(@user).deliver_now
			flash[:sucess] = "Please check your email to activate your account."
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
