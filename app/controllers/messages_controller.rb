class MessagesController < ApplicationController
	

	def new
		@current_user = current_user
		@user = User.find(params[:user_id])
		@message = @user.messages.build
		@sent = Message.where(sender_id: current_user.id, user_id: params[:user_id]).last(10).reverse
		@received = Message.where(user_id: current_user.id, sender_id: params[:user_id]).last(10).reverse
		
	end

	def show 
		 @message = Message.find(params[:id])
 	end	

	def create
		@message = Message.new(message_params)
		@message.save
		if @message.save
			redirect_to new_message_path
		else 
			redirect_to new_message_path, :alert => "Sorry, message can't be empty."
		end
	end

    skip_before_action :verify_authenticity_token
	def destroy 
		@message = Message.find(params[:id])
		@message.destroy
		render json: { success: true }
	end

	def index
		@messages = Message.where(user_id: current_user.id)
	end

	def received
		@received = Message.where(user_id: current_user.id, sender_id: params[:user_id], created_at: (Time.now - 3.seconds)..Time.now).last(10).reverse
		render :json => @received||[]
	end

private 

	  def message_params
      params.require(:message).permit(:user_id, :sender_id, :body)
    end

end
