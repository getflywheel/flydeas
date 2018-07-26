require "rails_helper"

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
		subject.salt = nil
		subject.encrypt_password
		expect(subject.match_password("123456xX$")).to be true
	end

	it "matches the password correctly" do
		subject.salt = nil
		subject.encrypt_password
		expect(subject.match_password("123")).to be false
	end
end
