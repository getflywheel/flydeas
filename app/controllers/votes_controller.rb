class VotesController < ApplicationController
	def update
		find_or_create_vote
		if @vote.weight != params[:weight]
			@vote.weight = params[:weight]
			@vote.save
		end
		redirect_to :back
	end

	private

	def find_or_create_vote
		@vote = Vote.where(
			post_id: post.id,
			user_id: params[:user_id],
			post_type: post.class.name
		).first_or_create
	end

	def post
		return @post if @post
		@post =
			if params[:comment_id]
				Comment.find(params[:comment_id])
			else
				Submission.find(params[:submission_id])
			end
		post # recursion
	end

	def vote_params
		params.permit(:user, :comment_id, :submission_id, :post_type, :weight)
	end

	def update_submission
		submission = Submission.find_by(id: submission_id)
		submission.update_vote_count unless submission.nil?
	end
end
