class SubmissionsController < ApplicationController
	before_action 	:set_submission,
		only: %i[show edit update destroy add_watcher remove_watcher]
	before_action :logged_in

	def logged_in
		return if logged_in?
		redirect_to "/login"
	end

	def index
		@submissions = Submission.order(vote_count: :desc, created_at: :desc)
	end

	def show; end

	def new
		@submission = Submission.new
	end

	def edit; end

	def create
		@submission = Submission.new(submission_params)
		@submission.status_id = 1
		if @submission.save
			create_vote
			redirect_to @submission
			return
		end
		render "new"
	end

	def update
		if @submission.update(submission_params)
			flash[:info] = "Submission was successfully updated."
			redirect_to @submission
		else
			flash[:info] = "Submission edit failed"
			render :edit
		end
	end

	def add_watcher
		@submission.watchers << User.find(params[:user_id])
		@submission.save
		redirect_to :back
	end

	def remove_watcher
		@submission.watchers.delete(User.find(params[:user_id]))
		@submission.save
		redirect_to :back
	end

	def destroy
		@submission.destroy
		redirect_to submissions_url
	end

	private

	def submission_params
		sub = params.require(:submission).permit(:title, :content, :category_id, :status_id)
		sub.merge(user_id: current_user.id)
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_submission
		@submission = Submission.find(params[:id])
	end

	def create_vote
		Vote.create(
			post: @submission, user_id: current_user.id,
			weight: 1
		)
	end
end
