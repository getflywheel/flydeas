class CategoriesController < ApplicationController
	before_action :set_category, only: %i[show]
	before_action :admin, only: %i[new create]

	def show; end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.color = Color.find(rand(40)).name
		@category.save
		redirect_to :root
	end

	private

	def admin
		redirect_to :root unless current_user.admin
	end

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :color)
	end
end
