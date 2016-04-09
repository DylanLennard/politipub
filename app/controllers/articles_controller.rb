class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!, except: [:index, :home, :show, :search]	
	before_action :article_show, only: [:show]


	def home
		@article_banner = Article.where(:published => true).last
		@articles = Article.all.order("created_at DESC").limit(8).where(:published => true)
	end

	def index
		@articles = Article.all.order("created_at DESC").where(:published => true).page params[:page]
	end

	def new
		@article = current_admin.articles.build
	end

	def create
		@article = current_admin.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@random_article = Article.where(:published => true).limit(3).order("RANDOM()")
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
		@article.destroy
		redirect_to :back
	end

	private

	def article_show
		@article = Article.find(params[:id])
		unless admin_signed_in? || @article.published?
			redirect_to root_path
		end
	end

	def article_params
		params.require(:article).permit(:title, :author, :body, :banner_image, :author_id, :published, :admin_id)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end