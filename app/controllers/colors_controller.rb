class ColorsController < ApplicationController
    def show; end

    private

    def set_color
        @color = Color.find(params[:id])
    end
end

