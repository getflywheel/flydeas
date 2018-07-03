class AccountActivationsController < ApplicationController
    #Confirms Email, RESTful route implemented, can be changed if necessary
    def edit
        user = User.find_by_activation_digest(params[:id])
        if user
          user.email_activate
          flash[:sucess] = "Welcome to Flydeas! Your email has been confirmed!"
          #TODO Uncomment this when completed with session control
          redirect_to root_url
        else
          flash[:error] = "Sorry, User does not exist"
          #TODO uncomment this when a homepage is implemented
          redirect_to root_url
        end
      end
end
