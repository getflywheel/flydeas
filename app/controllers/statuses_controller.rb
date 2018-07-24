class StatusesController < ApplicationController
    before_action :set_status, only: [:show]
    def show
    end

    private
    def set_category
        @status = Status.find(params[:id])
    end
end
