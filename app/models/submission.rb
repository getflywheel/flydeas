require 'vote_helper.rb'
class Submission < ActiveRecord::Base
	include VoteHelper
    belongs_to :user
    belongs_to :category
    has_many :votes
    
    validates :category_id,  presence: true
    validates :user_id, presence: true
    validates :content, presence: true
=begin    
    def update_vote_count 
        upvotes = Vote.where(submission_id: id, weight: 1)
        downvotes = Vote.where(submission_id: id, weight: -1)
        self.vote_count = upvotes.length - downvotes.length
        self.save
    end
=end
end
