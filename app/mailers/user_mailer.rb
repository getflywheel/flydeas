class UserMailer < ApplicationMailer

   # Subject can be set in your I18n file at config/locales/en.yml
   # with the following lookup:
   #
   #   en.user_mailer.accout_activation.subject
   #
	def account_activation(user)
		@user = user
	  mail to: user.email, subject: "Account activation"
    #flash[:notice] = "Please check your email to activate you account."
    #redirect_to(@user, :notice => 'user created')
	end
									
   # Subject can be set in your I18n file at config/locales/en.yml
   # with the following lookup:
   #
   #   en.user_mailer.password_reset.subject
   #
   def password_reset
     @greeting = "Hi"

     mail to: "to@example.org"
   end
end
