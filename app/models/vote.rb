class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :submission
    validates :submission_id, uniqueness: {scope: :user_id}
    after_save :update_submission

    private
        def update_submission
            submission = Submission.find_by(id: submission_id)
            if not submission.nil? 
                submission.update_vote_count
            end
        end
end
