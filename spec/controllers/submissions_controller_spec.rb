require "rails_helper"

RSpec.describe SubmissionsController, type: :controller do
	render_views
	before(:each) do
		@sub = create(:submission)
		@user = create(:user)
		login(@user)
	end

	describe "Get #index" do
		it "loads multiple submissions when logged in" do
			@sub2 = create(:submission)
			Vote.create(
				post: @sub2, user_id: @sub2.user_id,
				weight: 1
			)
			get :index
			expect(response.body).to include(@sub.title)
			expect(response.body).to include(@sub2.title)
		end

		it "redirects when not logged in" do
			logout
			get :index
			expect(response).to redirect_to "/login"
		end
	end

	describe "Get #new" do
		it "returns a success response when logged in" do
			login @user
			get :new
			expect(response).to have_http_status(:success)
		end

		it "redirects when not logged in" do
			logout
			get :new
			expect(response).to redirect_to "/login"
		end
	end

	describe "Get #Show" do
		it "shows a submissions correctly" do
			get :show, id: @sub.id
			expect(response.body).to include(@sub.content)
		end
	end

	describe "Get #Edit" do
		it "allows edit and shos the changes" do
			get :edit, id: 1
			expect(response.body).to include("Editing")
		end
		it "redirects when not logged in" do
			logout
			get :edit, id: @sub.id
			expect(response).to redirect_to "/login"
		end
	end

	describe "get #create" do
		it "allows for a submission to be created" do
			get :create, submission:
															 {
																 title: @sub.title,
																 content: @sub.content,
																 user_id: @user.id,
																 category_id: @sub.category_id
															 }
			expect(response).to have_http_status(302)
		end
		it "doesnt allow for subission to be created (invalid params)" do
			# @invalid_sub =  create(:invalid_submission)
			get :create, submission:
															 {
																 title: nil,
																 content: nil,
																 user_id: nil,
																 category_id: nil
															 }
			expect(response.body).to include("errors")
		end
	end

	describe "Put #update" do
		it "allows update to content" do
			content = "something other than what was there"
			get :update, submission:
															 {
																 content: content,
																 user_id: @sub.user_id,
																 category_id: @sub.category_id
															 }, id: @sub.id
			@sub.reload
			expect(@sub.content).to include(content)
		end

		it "denies update when not logged in" do
			logout
			content = @sub.content
			get :update, submission:
															 {
																 content: "new stuff",
																 user_id: @sub.user_id,
																 category_id: @sub.category_id
															 }, id: @sub.id
			@sub.reload
			expect(@sub.content).to include(content)
		end
	end

	describe "#Destroy " do
		it "allows a post to be destroyed" do
			get :destroy, id: @sub.id
			expect(Submission.find_by(id: @sub.id)).to_not be true
		end

		it "denies destroying by user that is not logged in" do
			logout
			get :destroy, id: @sub.id
			@sub.reload
			expect(@sub).to_not be_nil
		end
	end
end
