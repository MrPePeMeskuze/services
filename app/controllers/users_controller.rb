class UsersController < ApplicationController
	before_filter :admin_auth
	def show
		@user = User.find_by_login(params[:id])
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	    if @user.save
	    	sign_in @user
	    	flash[:success] = "Пользователь успешно создан!"
	      	redirect_to @user
	    else
	    	render 'new'
		end	
	end
	
	def edit
		@user = User.find_by_login(params[:id])
	end

	def update
		@user = User.find_by_login(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Данные пользователя отредактированны"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find_by_login(params[:id]).destroy
		flash[:success] = "Пользователь успешно удален!"
		redirect_to users_url
	end

	private

    def user_params
      params.require(:user).permit(:login, :email, :password, :password_confirmation, :name, :last_name, :middle_name)
    end

end
