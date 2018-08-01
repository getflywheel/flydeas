require 'rails_helper'

RSpec.describe NotificationHelper, type: :helper do
	describe "notify users" do
		it "creates notifications for all watchers" do
			pc = create(:post_change)
			sub = Submission.first
			pc.submission = sub
			create(:user)
			create(:user)
			create(:user)
			sub.watchers << User.all
			NotificationHelper.notify_users(pc)
			expect(Notification.all.length).to be == User.all.length
		end
	end
end
