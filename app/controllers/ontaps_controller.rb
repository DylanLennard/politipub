class OntapsController < ApplicationController
	before_action :find_ontap, only: [:show, :update, :edit, :delete]

	def new
	end

	def create
	end

	def index
		@ontaps = Ontap.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def search
	end

	def destroy
	end

	private

	def find_ontap
		@ontap = Ontap.find(params[:id])
	end

end
