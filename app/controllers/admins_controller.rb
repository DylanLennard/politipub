class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			redirect_to pages_dashboard_path, :flash => { :success => 'User was successfully created.' }
		else
			render 'new'
		end
	end

	private
	def admin_params
		params.require(:admin).permit(:email, :password, :password_confirmation)
	end
	
end