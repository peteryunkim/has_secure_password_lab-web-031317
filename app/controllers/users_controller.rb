class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if password_match?
			@user = User.new(user_params)
			@user.save
			session[:user_id] = @user.id
			# byebug
			redirect_to user_page_path(@user)
		else
			redirect_to signup_path
		end
	end

	def show
		# byebug
		@user = User.find(params[:id])
	end

private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

	def password_match?
		params[:user][:password] == params[:user][:password_confirmation]
	end


end
