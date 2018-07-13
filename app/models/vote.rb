class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :post, polymorphic: true
		
    #validates :user, uniqueness: :post 
	#validates_uniqueness_of :user, scope: [:post_id, :post_type]
    validates_inclusion_of :weight, :in => -1..1
    after_save :update_post

    private

	def update_post
		post.update_vote_score
	end
end
