class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]


	def home
		@article_banner = Article.last
		@articles = Article.all.order(:id).page params[:page]
	end

	def index
		@articles = Article.all.order(:id).page params[:page]
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
		@random_article = Article.limit(3).order("RANDOM()")
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
		if params[:search].present?
	      @articles = Article.search(params[:search])
	    else
	      @articles = Article.all.order(:id).page params[:page]
	    end
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