require 'rails_helper'

RSpec.describe "Submissions", type: :request do
  describe "GET /submissions" do
    it "works! (now write some real specs)" do
      get submissions_path
      expect(response).to have_http_status(302)
    end
  end
end
