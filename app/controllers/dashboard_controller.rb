class DashboardController < ApplicationController
	def index
		@page = 'dashboard'
	end

	def search
		@clients = Client.search(params[:search])
		@advocates = Advocate.search(params[:search])
		@case_files = CaseFile.search(params[:search])
	end

end
