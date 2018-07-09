class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :post, polymorphic: true
		
    validates :post_id, uniqueness: {scope: :user_id}
    validates_inclusion_of :weight, :in => -1..1
    after_save :update_post

    private
        def update_post
			#if post_type == "Submission"
				post = Submission.find_by(id: post_id)
			#end
   			return if post.nil?
			post.update_vote_score		         
        end
end
