class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new
		if @admin.save
			redirect_to root_path
		else
			render 'new'
		end
	end
end