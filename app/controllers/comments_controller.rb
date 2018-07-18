class CommentsController < ApplicationController
	def new; end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			Vote.create(
				post: @comment, user_id: current_user.id,
				weight: 1
			)
		end
		redirect_to :back
	end

	def update; end

	private

	def comment_params
		uncontained_params = params.permit(:submission_id, :parent_comment_id)
		uncontained_params.merge(params.require(:comment).permit(:content))
	end
end
