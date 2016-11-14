class OntapsController < ApplicationController
	before_action :find_ontap, only: [:show, :update, :edit, :delete]
	before_action :authenticate_admin!, except: [:index, :home, :show, :search]
	before_action :ontap_show, only: [:show]

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
	      @ontaps = Ontap.search(params[:search])
	    else
	      @ontaps = Ontap.all.order(:id).page params[:page]
	    end
	end

	def destroy
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
end
