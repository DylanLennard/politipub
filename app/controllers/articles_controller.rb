class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]


	def home
		@articles = Article.all
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def search
	end

	def destroy
	end

	private

	def article_params
		params.require(:article).permit(:title, :author, :body, :banner_image)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end