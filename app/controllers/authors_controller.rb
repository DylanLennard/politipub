class AuthorsController < ApplicationController
	before_action :find_author, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

	def index
		@authors = Author.all.order('name DESC')
	end

	def new
		if Author.exists?(:admin_id => current_admin.id)
			redirect_to edit_author_path(:id => current_admin.author.id)
		else
			@author = current_admin.build_author
		end
	end

	def create
		if Author.exists?(:admin_id => current_admin.id)
			redirect_to edit_author_path(:id => current_admin.author.id)
		else
			@author = current_admin.build_author(author_params)
			if @author.save
				redirect_to @author
			else
				render 'new'
			end
		end
	end

	def show
		if @author.validated?
			@articles = Article.where(:author_id => @author.id)
			@links = {
				"twitter.png"=> @author.twitter_link,
				"Google.png"=> @author.google_plus_link, 
				"linkedin.png"=> @author.linkedin_link, "Facebook.png"=> @author.facebook_link,
			}
		else
			redirect_to '/pages/dashboard'
		end
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
		@author.destroy
		redirect_to :back
	end

	private

	def find_author
		@author = Author.find(params[:id])
	end

	def author_params
		params.require(:author).permit(:name, :profile_image, :bio, :political_views, 
			:google_plus_link, :twitter_link, :linkedin_link, :facebook_link, :email_link, :admin_id,
			:validated
			)
	end
end
