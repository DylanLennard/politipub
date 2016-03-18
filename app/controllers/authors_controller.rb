class AuthorsController < ApplicationController
	before_action :find_author, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

	def index
		@authors = Author.all.order('name DESC')
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)
		if @author.save
			redirect_to @author
		else
			render 'new'
		end
	end

	def show
		@articles = Article.where(:author_id => @author.id)
	end

	def edit
	end

	def update
		if @author.update(author_params)
			redirect_to @author
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def find_author
		@author = Author.find(params[:id])
	end

	def author_params
		params.require(:author).permit(:name, :profile_image)
	end
end
