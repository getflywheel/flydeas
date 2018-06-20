class SessionsController < ApplicationController
    def new
    end
    
    # login w/ email and password
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.match_password(params[:session][:password])
            log_in user
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
