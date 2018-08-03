class LoginsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		encrypt
		send_activation_email
	end

	private

	def encrypt
		@user.create_salt
		@user.encrypt_password
	end

	def send_activation_email
		@user.create_activation_digest
		if @user.save
			UserMailer.account_activation(@user).deliver_now
			flash[:sucess] = "Please check your email to activate your account."
			redirect_to root_url
		else
			flash[:notice] = @user.errors.full_messages.to_sentence 
			render "new"
		end
	end

	def user_params
	 params.require(:user).permit(:username, :email, :password)
	end
end
