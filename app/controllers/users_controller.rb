class UsersController < ApplicationController
	def edit
		@user = User.find(current_user.id)
	end

	def update
		if current_user.update(users_params)
			redirect_to :root
		else
			render :edit
		end
	end

	private
	def users_params
		params.require(:user).permit(:name, :email)
	end
end
