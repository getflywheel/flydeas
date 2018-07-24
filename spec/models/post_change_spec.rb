require 'rails_helper'

RSpec.describe PostChange, type: :model do
	it "is valid with valid attributes" do
		post_change = build(:post_change)
		expect(post_change).to be_valid
	end

	it "is deleted when comment reference is deleted" do
		com  = create(:comment)
		pc = PostChange.find_by(change_object: com)
		com.destroy
		expect { pc.reload }.to raise_error ActiveRecord::RecordNotFound
	end
end
