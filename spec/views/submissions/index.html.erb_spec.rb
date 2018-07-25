require "rails_helper"

RSpec.describe "submissions/index", type: :view do
	before(:each) do
		assign(:submission, Submission.new)
		@user = create(:user)
		# login(@user)
		@current_user = @user
		@sub = create(:submission)
		@sub2 = create(:submission)
		@submissions = [@sub, @sub2]
	end

	it "renders the submissions" do
		render
	end
end
