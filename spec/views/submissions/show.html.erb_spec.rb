require 'rails_helper'

RSpec.describe "submissions/show", type: :view do
  before(:each) do
    @category = create(:category)
	@submission = create(:submission)
  end

  it "renders attributes in <p>" do
    render
  end
end
