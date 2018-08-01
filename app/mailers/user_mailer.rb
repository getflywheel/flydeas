class UserMailer < ApplicationMailer
	before_action :inline_logo

	def account_activation(user)
		@user = user
		mail to: user.email, subject: "Account activation"
	end

	def password_reset(user)
		@user = user
		mail to: user.email, subject: "Password reset"
	end

	def notifications(user)
		@user = user
		mail to: user.email, subject: "Stuff happened recently"
	end

	private

	def inline_logo
		attachments.inline["logo-green.png"] = File.read("app/assets/images/logo-green.png")
	end
end
