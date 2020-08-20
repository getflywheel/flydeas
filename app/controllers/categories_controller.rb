class CategoriesController < ApplicationController
	before_action :set_category, only: :show
	before_action :admin, only: %i[new create]

	def show; end
# there is no path for getting to a new category,
# suggestion: add button at root path for admins
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.color = Color.find_by(id: rand(40)).name # needed to include id: or use find_by_id
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
