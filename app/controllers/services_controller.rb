class ServicesController < ApplicationController
	before_action :admin_auth, only: [:edit, :update, :create, :delete, :index]

	def show
		@parent = Services.where(parent_id: 0).where(is_published: 1).order(:position)
		@service = Services.find_by_full_path(request.path)
	end

	def index
		@services = Services.paginate(page: params[:page], per_page: 10).where(parent_id: 0).order(:is_published).order(:position)
	end

	def new
		@parents = Services.where(parent_id: 0).where(is_published: 1)
		@service = Services.new
	end

	def create
		@parents = Services.where(parent_id: 0).where(is_published: 1)
		@service = Services.new(service_params)
		@service.auser_id = current_user.id
		if params[:services][:parent_id] == 0 
			@service.full_path="/services"+@service.url
		else
			@parent= Services.find(params[:services][:parent_id])
			@service.full_path=@parent.full_path+"/"+params[:services][:url]
		end
	    if @service.save
	    	flash[:success] = "Услуга успешно создана!"
	      	redirect_to admin_services_path
	    else
	    	render 'new'
		end	
	end
	
	def edit
		@parents = Services.where(parent_id: 0).where(is_published: 1)
		@service = Services.find_by_url(params[:id])
	end

	def update
		@parents = Services.where(parent_id: 0).where(is_published: 1)
		@service = Services.find_by_url(params[:id])
		@service.auser_id=current_user.id
		if params[:services][:parent_id].equal?(0) or params[:services][:parent_id] == nil
			@service.full_path="/services/"+@service.url
		else
			@parent= Services.find(params[:services][:parent_id])
			@service.full_path=@parent.full_path+"/"+params[:services][:url]
		end
		if @service.update_attributes(service_params)
			flash[:success] = "Услуга успешно отредактированна"
			redirect_to admin_services_path
		else
			render 'edit'
		end
	end

	def destroy
		Services.find_by_url(params[:id]).destroy
		flash[:success] = "Услуга успешно удалена!"
		redirect_to admin_services_path
	end

	private

	    def service_params
	      params.require(:services).permit(:parent_id, :is_published, :url, :header, :title, :body, :position, :image )
	    end
end
