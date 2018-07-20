require 'rails_helper'

RSpec.describe Vote, type: :model do
	before(:each) do
		@sub = create(:submission)
		@com = create(:comment)
		@user = create(:user)        
	end 

	it "allows valid submission vote" do
		vote = Vote.new(post: @sub, user: @user)
		expect(vote).to be_valid  
	end

	it "allows valid comment vote" do
		vote = Vote.new(post: @com, user: @user)
		expect(vote).to be_valid 	
	end 

	it "denies duplicate creation" do
		vote1 = Vote.create(post: @sub, user: @user)
		vote2 = Vote.new(post: @sub, user: @user)
		expect(vote2).to be_invalid
	end

	it "does not count submission vote as comment vote or vice versa" do
		@sub.id = 500
		@com.id = 500
		@sub.save
		@com.save
		vote1 = Vote.create(post: @sub, user: @user, weight: 1)
		vote2 = Vote.create(post: @com, user: @user, weight: 1)
		@sub.update_vote_score
		@com.update_vote_score
		expect(@com.vote_count).to be == 1  
		expect(@sub.vote_count).to be == 1 
	end	

	it "denies out of range weight" do
		vote = Vote.create(post: @sub, user: @user, weight: 2)
		vote.weight = 2 
		expect(vote).to be_invalid
		vote.weight = -2
		expect(vote).to be_invalid
		vote.weight = -1
		expect(vote).to be_valid
		vote.weight = 0
		expect(vote).to be_valid
		vote.weight = 1 
		expect(vote).to be_valid
	end
end
