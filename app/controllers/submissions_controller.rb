class SubmissionsController < ApplicationController
	before_action :set_submission, only: %i[show edit update destroy]
	before_action :logged_in

	def logged_in
		return if logged_in?
		redirect_to "/login"
	end

	# GET /submissions
	# GET /submissions.json
	def index
		@submissions = Submission.order(vote_count: :desc, created_at: :desc)
	end

	# GET /submissions/1
	# GET /submissions/1.json
	def show; end

	# GET /submissions/new
	def new
		@submission = Submission.new
	end

	# GET /submissions/1/edit
	def edit; end

	# POST /submissions
	# POST /submissions.json
	def create
		@submission = Submission.new(
			submission_params.merge(user_id: current_user.id)
		)
		if @submission.save
			Vote.create(
				submission_id: @submission.id, user_id: current_user.id,
				weight: 1
			)
			redirect_to @submission
			return
		end
		render "new"
	end

	# PATCH/PUT /submissions/1
	# PATCH/PUT /submissions/1.json
	def update
		if @submission.update(submission_params)
			flash[:info] = "Submission was successfully updated."
			redirect_to @submission
		else
			flash[:info] = "Submission edit failed"
			render :edit
		end
	end

	# DELETE /submissions/1
	# DELETE /submissions/1.json
	def destroy
		@submission.destroy
		redirect_to submissions_url
	end

	private

	def submission_params
		params.require(:submission).permit(:title, :content, :category_id)
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_submission
		@submission = Submission.find(params[:id])
	end
end
