class PagesController < ApplicationController

	before_action :authenticate_admin!, only: [:dashboard]

	def dashboard
		@authors = Author.limit(10).order("created_at DESC")
		@articles = Article.limit(10).order("created_at DESC")
		@categories = Category.limit(10).order("created_at DESC")
		@ontaps = Ontap.limit(10).order("created_at DESC")
	end

	def articles_dashboard
		@articles = Article.all.order("created_at DESC")
	end

	def about
	end

	def contact
	end


	private
		def find_author
			@author = Author.find(params[:id])
		end

		def find_article
			@article = Article.find(params[:id])
		end
end
