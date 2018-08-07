class CategoriesController < ApplicationController
	#before_action :set_category ,only: [:show, :create]

	def show; end

	def create 
		@category = Category.new(category_params)
		@category.color = Color.find_by_id(rand(40)).name
		if @category.save
			redirect_to root_url
			return
		end

	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :color)
	end
end