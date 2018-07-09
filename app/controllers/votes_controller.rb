class VotesController < ApplicationController
	def new
		@vote = Vote.find_by(
			post_id: params[:submission_id], # || params[:comment_id]
			#post_type: params[:post_type],
			user_id: params[:user_id]
		)
		if @vote.nil?
			create
		else
			update
		end
	end

	def create
		@vote = Vote.new(vote_params)
		redirect_to submissions_url unless @vote.save
		#redirect_to root_url
		flash[:info] = "voted"
		update_submission
		redirect_to submissions_url
		#redirect_to root_url
	end

	def update
		if @vote.weight != params[:weight]
			@vote.weight = params[:weight]
			@vote.save
		end
		redirect_to submissions_url
	end

	private

	def vote_params
		params.permit(:user_id, :comment_id, :submission_id, :post_type, :weight)
	end

	def update_submission
		submission = Submission.find_by(id: submission_id)
		submission.update_vote_count unless submission.nil?
	end
end
