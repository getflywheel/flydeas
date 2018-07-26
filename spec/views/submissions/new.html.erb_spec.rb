require "rails_helper"

RSpec.describe "submissions/new", type: :view do
	before(:each) do
		assign(:submission, Submission.new)
		@user = create(:user)
		@current_user = @user
	end

	it "renders new submission form" do
		render

		assert_select "form[action=?][method=?]", submissions_path, "post" do
		end
	end
end
