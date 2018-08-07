class SubmissionsController < ApplicationController
	before_action(
		:set_submission,
		only: %i[show edit update destroy add_watcher remove_watcher]
	)
	before_action :logged_in

	def logged_in
		redirect_to "/login" unless logged_in?
	end

	def persist_status_checkbox(name)
		persist_checkbox(name, :statuses)
	end
	helper_method :persist_status_checkbox

	def persist_category_checkbox(name)
		persist_checkbox(name, :categories)
	end
	helper_method :persist_category_checkbox

	def index
		@submissions = Submission.all
		filters = params[:filters]
		@submissions = SubmissionsHelper.filter(@submissions, filters) unless filters.nil?
		@submissions = SubmissionsHelper.sort(@submissions, order)
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
		flash[:info] = "Submission successfully deleted"
		redirect_to submissions_url
	end

	private

	def order
		if params[:filters].nil? || params[:filters][:order].nil?
			"votes high to low"
		else
			params[:filters][:order]
		end
	end

	def persist_checkbox(name, type)
		return true if params[:filters].nil? || params[:filters][type].nil?
		params[:filters][type].include? name
	end

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
