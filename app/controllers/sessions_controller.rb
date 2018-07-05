class SessionsController < ApplicationController
	def new
		return unless logged_in?
		redirect_to root_path
	end

	# login w/ email and password
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		return unless valid_user(user)
		log_in(user)
		redirect_to root_path
	end

	# Log out
	def destroy
		log_out
		render "new"
	end

	def valid_user(user)
		error = nil
		if !user || !user.match_password(params[:session][:password])
			error = "Invalid email/password combination"
		elsif !user.activated
			error = "Your account has not been activated yet"
		end
		return true if error.nil?
		flash.now[:danger] = error
		render "new"
		false
	end
end
