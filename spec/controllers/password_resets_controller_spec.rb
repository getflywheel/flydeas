require "rails_helper"

RSpec.describe PasswordResetsController, type: :controller do
	render_views
	before do
		@user = User.new(
			username: "test",
			email: "test@getflywheel.com",
			password: "Flywheel1!"
		)
		@user.encrypt_password
		@user.save
	end

	describe "GET #new" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #create" do
		it "denies changing password of address that does not exist" do
			get :create, password_reset: { email: "💩@getflywheel.com" }
			expect(response.body).to include("Email address not found")
		end

		it "denies unactivated account changing its password" do
			get :create, password_reset: { email: "test@getflywheel.com" }
			expect(response).to redirect_to(root_url)
		end

		# TODO: Implement this test after testing workshop
		it "denies expired reset request" do
			# @user.activated = true
			# @user.reset_sent_at = 1.hours.ago
			# @user.reset_digest = User.digest("1234")
			# @user.save
			# Issue: Getting token to access update
			# get :create, {:password_reset => {email: 'test@getflywheel.com' } }
			# get :update, {id: "1234",
			# 							email: "test@getflywheel.com",
			# 							user: password: "Flywheel2!"}
		end

		it "allows a valid user and request to reset the password" do
		end
	end
end
