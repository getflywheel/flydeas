require "rails_helper"

RSpec.describe SessionsController, type: :controller do
	render_views
	before(:each) do
		@user = create(:user)
	end

	context "When testing the SessionsController class" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end

		it "should log in sucessfully" do
			get :create, session: { email: @user.email, password: "Flywheel1!" }
			expect(response).to redirect_to root_path
		end

		it "should deny log in with incorrect password" do
			get :create, session: { email: @user.email, password: "WrongPass" }
			expect(response.body).to include("Login")
		end

		it "should deny log in with non-existent email" do
			get :create, session: { email: "💩@getflywheel.com", password: "WrongPass" }
			expect(response.body).to include("Login")
		end
	end
end
