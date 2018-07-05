class AccountActivationsController < ApplicationController
	def edit
		user = User.find_by(activation_digest: params[:id])
		if user
			user.email_activate
			flash[:sucess] = "Welcome to Flydeas! Your email has been confirmed!"
		else
			flash[:error] = "Sorry, User does not exist"
		end
		redirect_to root_url
	end
end
