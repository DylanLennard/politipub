class CategoriesController < ApplicationController

	before_action :authenticate_admin!, except: [:index]
	before_action :find_category, only: [:show]
	
	def index
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def show
		@category_articles = @category.articles
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end