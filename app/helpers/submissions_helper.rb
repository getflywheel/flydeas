module SubmissionsHelper
	def self.sort(submissions, order)
		case order
		when "date newest to oldest"
			submissions.sort_by(&:created_at).reverse
		when "date oldest to newest"
			submissions.sort_by(&:created_at)
		when "votes low to high"
			submissions.sort_by(&:vote_count)
		else
			submissions.sort_by(&:vote_count).reverse
		end
	end

	def self.filter(submissions, filters)
		submissions = submissions.category(filters[:categories]) unless
			filters[:categories].nil?
		submissions = submissions.status(filters[:statuses]) unless
			filters[:statuses].nil?
		submissions
	end
end
