module VoteHelper
	def update_vote_score
		upvotes = Vote.where(post: self, weight: 1)
		downvotes = Vote.where(post: self, weight: -1)
		self.vote_count = upvotes.length - downvotes.length
		save
	end
end
