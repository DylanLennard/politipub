class OntapsController < ApplicationController
	before_action :find_ontap, only: [:show, :update, :edit, :destroy]
	before_action :authenticate_admin!, except: [:index, :home, :show, :search]
	before_action :ontap_show, only: [:show]
	before_action :title

	def new
		@ontap = current_admin.ontaps.build
	end

	def create
		@ontap = current_admin.ontaps.build(ontap_params)

		if @ontap.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@ontap_banner = Ontap.where(:published => true).last
		@ontaps = Ontap.all.order("created_at DESC").where(:published => true).page params[:page]
	end

	def show
	end

	def edit
	end

	def update
		if @ontap.update(ontap_params)
			redirect_to @ontap
		else
			render 'edit'
		end
	end

	def search
		if params[:search].present?
		  @filter = Ontap.all.order("created_at DESC").page params[:page]
	      @ontaps = @filter.search(params[:search], where: {published: true})

	    else
	      @ontaps = Ontap.all.order("created_at DESC").where(:published => true).page params[:page]
	    end
	end

	def destroy
		@ontap.destroy
		redirect_to :back
	end

	private

	def find_ontap
		@ontap = Ontap.find(params[:id])
	end

	def ontap_params
		params.require(:ontap).permit(:title, :author, :body, :published, :banner, :author_id, :admin_id)
	end

	def ontap_show
		@ontap = Ontap.find(params[:id])
		unless admin_signed_in? || @ontap.published?
			redirect_to root_path
		end
	end

	def title
		@title = "On Tap"
	end
end
