class PasswordResetsController < ApplicationController
    before_action :get_user, only: [:edit, :update]
    before_action :valid_user, only: [:edit, :update]

    def new
    end

    def edit
    end

    def create
        @user = User.find_by(email: params[:password_reset][:email].downcase)
        if @user
            @user.create_reset_digest
            # TODO: Enable sending an email -->IMPLEMENTED
            # @user.send_password_reset_email
            # flash[:info] = "Email sent with password reset instructions"
            reset_user_link = edit_password_reset_url(@user.reset_token, 
                email: @user.email) 
            flash[:info] = "Link: #{reset_user_link}"
            #redirect_to root_url
            render 'new'
        else
            flash.now[:danger] = "Email address not found"
            render 'new'
        end
    end    

    def edit
    end

    private
        def get_user
            @user = User.find_by(email: params[:email])
        end  

        # Confirms a valid user
        def valid_user
            unless (@user && @user.activated? &&
                    @user.authenticated?(:reset, params[:id]))
            redirect_to root_url
            end
        end
end
