require "rails_helper"

RSpec.describe Status, type: :model do
	it "is valid with valid attributes" do
		status = Status.new
		status.name = "open"
		expect(status).to be_valid
	end

	it "is invalid without name" do
		status = Status.new
		expect(status).to_not be_valid
	end
end
