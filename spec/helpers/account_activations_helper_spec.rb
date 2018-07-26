require "rails_helper"

# Specs in this file have access to a helper object that includes
# the AccountActivationsHelper. For example:
#
# describe AccountActivationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AccountActivationsHelper, type: :helper do
	let(:user) { User.create(username: "testus3e4drw1", email: "test@getflywheel.com", password: "123456xX$", salt: "1234") }
	it "Authenticates the User" do
		user.email_activate
		expect(user.activated?).to be true
	end
end
