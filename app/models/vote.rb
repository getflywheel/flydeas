class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :post, polymorphic: true

	validates :user, uniqueness: { scope: %i[post_id post_type] }
	validates :weight, inclusion: { in: -1..1 }
	after_save :update_post

	private

	def update_post
		post.update_vote_score
	end
end
