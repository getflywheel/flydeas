class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.match_password(params[:session][:password])
            # log in
            log_in user
           render 'new' 
        else   
            flash.now[:danger] = 'Invalid email/password combination' 
            render 'new'
        end 
    end

    def destroy
        log_out
        # TODO: Redirect somewhere
        render 'new'
    end
end
