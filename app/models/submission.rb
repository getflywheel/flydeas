class Submission < ActiveRecord::Base
    belongs_to :user
    has_many :votes
    validates :category,  presence: true
    validates :user_id, presence: true
    validates :content, presence: true
    
    def update_vote_count 
        upvotes = Vote.where(submission_id: id, weight: 1)
        downvotes = Vote.where(submission_id: id, weight: -1)
        self.vote_count = upvotes.length - downvotes.length
        self.save
    end
end
