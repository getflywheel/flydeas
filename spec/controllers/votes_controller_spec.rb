require "rails_helper"

RSpec.describe VotesController, type: :controller do
  before(:each) do
    @vote = create(:vote)
    request.env["HTTP_REFERER"] = "www.example.com"
  end

  describe "Put #update" do
    it "allows update to vote on submissions" do
      expect(@vote.weight).to eq(0)
      put :update, :id => @vote, :submission_id => @vote.post_id, :user_id => @vote.user_id, :weight => 1
      expect(@vote.reload.weight).to eq(1)
      response.should redirect_to "www.example.com"
    end
	end
end
