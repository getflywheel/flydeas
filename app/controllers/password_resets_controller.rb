class PasswordResetsController < ApplicationController
    before_action :get_user, only: [:edit, :update]
    before_action :valid_user, only: [:edit, :update]    
    before_action :check_expiration, only: [:edit, :update]
    before_action :valid_token, only: [:edit, :update]

    def new
    end

    def edit
        check_expiration
    end

    def create
        @user = User.find_by(email: params[:password_reset][:email].downcase)
        if @user
            @user.create_reset_digest
            @user.send_password_reset_email
            flash[:info] = "Email sent with password reset instructions"
            redirect_to root_url
        else
            flash.now[:danger] = "Email address not found"
            render 'new'
        end
    end

    def update
        if params[:user][:password].empty?
            @user.errors.add(:password, "can't be empty")
            render 'edit'      
        elsif @user.update_attributes(user_params)
            @user.encrypt_password
            @user.save
            @user.update_attribute(:reset_digest, nil)
            flash[:success] = "Password has been reset."
            log_in @user
            redirect_to root_url
        else
            render 'edit'
        end
    end
   
    private

        def check_expiration
            if @user.password_reset_expired?
                flash[:danger] = "Password reset has expired."
                redirect_to new_password_reset_url
            end
        end

        def user_params
            params.require(:user).permit(:password)
        end
        
        # Find user given email param
        def get_user
            @user = User.find_by(email: params[:email])
        end  

        # Confirms a valid user
        def valid_user
            unless (@user && @user.activated?) 
                flash[:danger] = "Please confirm your email address before you reset your password"
                redirect_to root_url
            end
        end
        
        def valid_token
            unless(@user.valid_reset_token?(params[:id]))
                flash[:danger] = "Invalid token" 
                redirect_to root_url
            end
        end
end
