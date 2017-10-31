class UsersController < ApplicationController
	def edit
	end

	def update
		if current_user.update(users_params)
			redirect_to :root, notice: 'ユーザー情報を変更しました'
		else
			render :edit, alert: 'エラーが発生しました'
		end
	end

	private
	def users_params
		params.require(:user).permit(:name, :email)
	end
end
