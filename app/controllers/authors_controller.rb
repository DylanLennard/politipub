class AuthorsController < ApplicationController
	before_action :find_author, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!, except: [:show]
	before_action :title

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
			@articles = Article.where(:author_id => @author.id).where(:published => true)
			@links = {
				"twitter.png"=> @author.twitter_link,
				"Google.png"=> @author.google_plus_link, 
				"linkedin.png"=> @author.linkedin_link, 
				"Facebook.png"=> @author.facebook_link,
				"tumblr.png" => @author.tumblr_link,
				"personal.png" => @author.personal_link

			}
		else
			redirect_to :back
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
			:google_plus_link, :twitter_link, :linkedin_link, :facebook_link, :email_link, :tumblr_link, :personal_link, :admin_id,
			:validated
			)
	end

	def title
		@title = "Authors"
	end
end
