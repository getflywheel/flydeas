class CategoriesController < ApplicationController
	before_action :set_category, :create, only: [:show, :create]

	def show; end

	def create 
		num =  rand(40)
		@category.color = Color.find_by_id(num).name
		@category.save
	end

	private

	def set_category
		@category = Category.find(params[:id])
		num = rand(40)
		@category.color = Color.find_by_id(num).name
	end
	def user_params
		params.require(:category).permit(:name, :color)
	end
end
