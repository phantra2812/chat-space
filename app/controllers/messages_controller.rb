class MessagesController < ApplicationController
before_action :find_group, only: [:index, :create]

	def index
		@message = Message.new
		@messages = @group.messages
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to group_messages_path, notice: 'メッセージ送信成功'
		else
		   render :index, alert: 'メッセージ送信失敗'
		end

	end

	private
	def find_group
        @group = Group.find(params[:group_id])
	end

	def message_params
		params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
	end
end
