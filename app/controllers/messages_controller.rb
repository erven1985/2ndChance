class MessagesController < ApplicationController
	

	def new
		@current_user = current_user
		@user = User.find(params[:user_id])
		@message = @user.messages.build
		@messages = Message.all
		
	end


def create
	@message = Message.new(message_params)
	@message.save
	if @message.save
		redirect_to new_message_path
	end
end


private 

 def message_params
      params.require(:message).permit(:user_id, :sender_id, :body)
    end

end
