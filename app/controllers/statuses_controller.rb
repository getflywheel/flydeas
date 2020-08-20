class StatusesController < ApplicationController
	before_action :set_status, only: [:show]
	def show 
	end

	private
	def set_status
		@status = Status.find(params[:id])
	end
	
	def status_params
		params.require(:status).permit(:status_id, :name, :password)
	end
end
