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

	def destroy
		@comment = Comment.find(params[:comment])
		# If comment has children, just delete content so that children
		# can continue to exist
		if Comment.where(parent_comment_id: @comment.id).any?
			@comment.content = "[DELETED]"
			@comment.save
		else
			@comment.destroy
		end
		redirect_to :back
	end

	private

	def comment_params
		uncontained_params = params.permit(:submission_id, :parent_comment_id)
		uncontained_params.merge(params.require(:comment).permit(:content))
	end
end
