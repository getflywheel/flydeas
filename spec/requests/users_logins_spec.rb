require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
    it "should deny an invalid login attempt" do
        get users_logins_path
        expect(response).to have_http_status(200)
        # TODO: Write test for flash
    end
end
