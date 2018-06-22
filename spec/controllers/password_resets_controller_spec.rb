require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do
    render_views
    before do
        @user = User.new(
            username: "test",
            email: "test@getflywheel.com",
            password: "Flywheel1!",
        )
        @user.encrypt_password
        @user.save
    end

    describe "GET #new" do
        it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
        end

        it "denies changing password of address that does not exist" do
            get :create, {:password_reset => {email: 'nonexistentemail@getflywheel.com' } }
            expect(response.body).to include("Email address not found") 
        end
       
        it "denies unactivated account changing its password" do
            get :create, {:password_reset => {email: 'test@getflywheel.com' } }
            expect(response.body).to include("Please confirm your email address before you reset your password") 
        end
        
        it "denies expired reset request" do
            
        end

        it "allows a valid user and request to reset the password" do
        
        end 
    end
    
end
