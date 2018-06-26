class VotesController < ApplicationController
    def new 
        puts params
        @vote = Vote.new(vote_params)
        redirect_to submissions_url
    end
    def create
        @vote.weight = vote
        @vote = Vote.new(vote_params)
        if @vote.save
            redirect_to submissions_url
        else
            flash[:error]= "you have already voted"
        end
    end

    def upvote
        puts 2234234

    end
    private
        def vote_params
            params.require(:vote).permit(:submission_id, :weight)
        end
end
