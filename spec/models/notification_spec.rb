require 'rails_helper'

RSpec.describe Notification, type: :model do
	it "is valid with valid attributes" do
		notification = build(:notification)
		expect(notification).to be_valid
	end 

	it "rejects duplicates" do
		notification1 = create(:notification)
		notification2 = Notification.new(user_id: notification1.user.id, post_change: notification1.post_change)
		expect(notification2).to_not be_valid
	end

	it "is destroyed if referenced post change destroyed" do
		notification = create(:notification)
		pc = notification.post_change
		pc.destroy
		expect { notification.reload }.to raise_error ActiveRecord::RecordNotFound
	end

	it "is destroyed if referenced user is destroyed" do
		notification = create(:notification)
		user = notification.user
		user.destroy
		expect { notification.reload }.to raise_error ActiveRecord::RecordNotFound
	end
end
