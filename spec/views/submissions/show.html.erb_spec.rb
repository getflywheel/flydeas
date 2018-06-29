require 'rails_helper'

RSpec.describe "submissions/show", type: :view do
  before(:each) do
    @submission = create(:submission)
  end

  it "renders attributes in <p>" do
    render
  end
end
