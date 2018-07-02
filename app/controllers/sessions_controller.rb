class SessionsController < ApplicationController
    def new
    end
    
    # login w/ email and password
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user.activated && user && user.match_password(params[:session][:password])
            log_in user
           render 'new' 
        elsif !user.activated
            flash.now[:danger] = 'You have not activated your account'
            render 'new'
        else   
            flash.now[:danger] = 'Invalid email/password combination' 
            render 'new'
        end 
    end
    
    # Log out
    def destroy
        log_out
        # TODO: Redirect somewhere
        render 'new'
    end
end
