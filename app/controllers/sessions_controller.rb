class SessionsController < ApplicationController

	def new
	end

	def create
		if params[:user][:password].present? && params[:user][:name].present?
			@user = User.find_by(name: params[:user][:name])
		    	if @user.authenticate(params[:user][:password])
		    		session[:user_id] = @user.id
		    		redirect_to user_page_path(@user)
		    	else
		    		redirect_to login_path
		    	end
    else
    	redirect_to login_path
    end
	end

	def delete
		session.destroy
		redirect_to login_path
	end

end
