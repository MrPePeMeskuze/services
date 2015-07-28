class SearchController < ApplicationController

	def index
		@search = Services.where('header LIKE ? OR body LIKE ?', "%#{params[:search]}%" , "%#{params[:search]}%").where("parent_id != 0")
	end

end