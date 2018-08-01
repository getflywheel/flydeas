require "rails_helper"

RSpec.describe Submission, type: :model do
	describe "notifies watchers" do
		it "on status change" do
			sub = create(:submission)
			stat = create(:status)
			sub.watchers << User.all
			sub.save
			sub.status = stat
			sub.save
			expect(Notification.all.length).to be == User.all.length							
		end	

		it "on vote count change" do
			sub = create(:submission)
			stat = create(:status)
			sub.watchers << User.all
			sub.save
			sub.vote_count = 100 
			sub.save
			expect(Notification.all.length).to be == User.all.length							
		end    
	end
end
