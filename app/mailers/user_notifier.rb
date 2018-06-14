class UserNotifier < ApplicationMailer
    default :from => 'flydeas@getflywheel.com'

    def send_signup_email(user)
        @user = user
        mail( :to => @user.email, :subject => 'Thanks for signing up for Flydeas!!')
    end
end
