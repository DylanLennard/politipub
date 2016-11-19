class PagesController < ApplicationController

	before_action :authenticate_admin!, only: [:dashboard]

	def dashboard
		@authors = Author.limit(10)
		@articles = Article.limit(10)
	end

	def articles_dashboard
		@articles = Article.all
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
