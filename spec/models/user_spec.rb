require 'rails_helper'

RSpec.describe User, type: :model do
    describe "validations" do
        let (:user) { User.new(username: "testuser", email: "test@getflywheel.com", password: "123456xX$", salt: "1234" ) }
	context "for presence of data in certain fields" do
	    it "is valid with valid attributes" do
	    	expect(user).to be_valid
	    end
	    it "is not valid with invalid attributes"			
            it "is not valid without a username" 
            it "is not valid without a email"
            it "is not valid without a salt"
            it "is not valid without a password"
	 end
    end
end
