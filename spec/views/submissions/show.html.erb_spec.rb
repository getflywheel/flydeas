require 'rails_helper'

RSpec.describe "submissions/show", type: :view do

  before(:each) do
    @category = create(:category)
    @submission = create(:submission)
    @user = create(:user)
    # login(@user)
  end

  it "renders attributes in <p>" do
    # TODO finish this test after FLYD-55 is complete
    # pending("Submission Form must be updated for this test to run")
    # render
  end
end
