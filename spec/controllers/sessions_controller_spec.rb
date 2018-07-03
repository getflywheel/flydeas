require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    render_views
    before do
=begin
        @user = User.new(
            username: "test",
            email: "test@getflywheel.com",
            password: "Flywheel1!",
        )
        @user.encrypt_password
        @user.save
=end
        @user = create(:user)
    end
 
    context "When testing the SessionsController class" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
        
        it "should log in sucessfully" do
            get :create, {:session => {:email => @user.email, :password => "Flywheel1!" } } 
            expect(response.body).to include("Log out")
        end

        it "should deny log in with incorrect password" do
            get :create, {:session => {:email => @user.email, :password => 'WrongPass' } } 
            expect(response.body).to_not include("Log out")
        end

        it "should deny log in with non-existent email" do
            get :create, {:session => {:email => 'shouldNotBeInDB@getflywheel.com', :password => 'WrongPass' } } 
            expect(response.body).to_not include("Log out")
        end
    end 
end
