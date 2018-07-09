require 'rails_helper'

RSpec.describe Vote, type: :model do
    before(:each) do
        @sub = create(:submission)
        @user = create(:user)        
    end 

    it "allows valid vote" do
        vote = Vote.new(post: @sub, user: @user)
        expect(vote).to be_valid  
    end
    
    it "denies duplicate creation" do
        vote1 = Vote.create(post: @sub, user: @user)
        vote2 = Vote.new(post: @sub, user: @user)
        expect(vote2).to be_invalid
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
