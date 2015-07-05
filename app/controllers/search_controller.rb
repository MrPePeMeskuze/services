class SearchController < ApplicationController

	def index
		@search = Services.where('header LIKE ? OR header LIKE ?', "%#{params[:search]}%" , "%#{params[:search]}%" )
	end

end