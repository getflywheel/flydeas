class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :is_logged_in
    
  def is_logged_in
    if logged_in?
      
    else
      flash[:error] ="Not logged in"
      redirect_to root_url
    end
  end
  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      flash[:info] = "You created a post"
      vote = Vote.new(submission_id: @submission.id, user_id: current_user.id, weight: 1)
      vote.save
      redirect_to @submission
    else
      flash[:danger] = "failed"
      render 'new'
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
    def update
        if @submission.update(submission_params)
            flash[:info] = 'Submission was successfully updated.'  
            redirect_to @submission 
        else 
            flash[:info] = 'Submission edit failed'
            render :edit 
        end
   end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def submission_params
       params.require(:submission).permit(:title, :content, :user_id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end
end
