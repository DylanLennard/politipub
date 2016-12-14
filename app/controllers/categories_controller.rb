class CategoriesController < ApplicationController

	before_action :authenticate_admin!, except: [:index, :show]
	before_action :find_category, only: [:show, :edit, :destroy, :update]
	
	def index
		@categories = Category.all
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

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end

	def show
		@category_articles = @category.articles.order("created_at DESC")
	end

	def destroy
		@category.destroy
		redirect_to :back
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end