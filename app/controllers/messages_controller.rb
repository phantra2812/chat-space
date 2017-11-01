class MessagesController < ApplicationController
before_action :find_group, only: [:index, :create]

	def index
		@message = Message.new
		@messages = @group.messages
		respond_to do |format|
			format.html
			format.json {	@new_messages = @group.messages.where('id > ?', params[:message][:id]) }
		end
	end

	def create
		@messages = @group.messages
		@message = Message.new(message_params)
		if @message.save
		respond_to do |format|
			format.html { redirect_to group_messages_path(params[:group_id]), notice: 'メッセージ送信成功' }
			format.json
		end

		else
		   flash.now[:alert] = 'メッセージを入力してください'
		   render :index
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
