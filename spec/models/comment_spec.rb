require 'rails_helper'

RSpec.describe Comment, type: :model do
	describe "notifies watchers" do
		it "on comment creation" do
			com = build(:comment)
			sub = Submission.first
			create(:user)
			sub.watchers << User.all
			sub.save
			com.submission = sub
			com.save
			expect(Notification.all.length).to be == User.all.length
		end	
	end
end
