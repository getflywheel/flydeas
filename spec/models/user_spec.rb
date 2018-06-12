require 'rails_helper'

RSpec.describe User, type: :model do
	subject { described_class.new(username: "testuser", email: "test@getflywheel.com", password: "123456xX$", salt: "1234") }

	it "is valid with valid attributes" do
 		expect(subject).to be_valid
	end
	it "is not valid without a username" do
		subject.username = nil
		expect(subject).to_not be_valid	
	end
	it "is not valid without a email" do
		subject.email = nil
		expect(subject).to_not be_valid	
	end
	it "is not valid without a salt" do
		subject.salt = nil
		expect(subject).to_not be_valid
	end
	it "is not valid without a password" do
		subject.password = nil
		expect(subject).to_not be_valid	
	end
	it "matches the password correctly" do
		expect(subject.password).matches("123456xX$")
	end
end
