class UsersController < ApplicationController

  def profile 
    @places = current_user.places.last(4).reverse
    @all = []
    @messages = Message.where(sender_id:current_user.id)
      @messages.each do |m|
        @all.push(User.find(m.user_id))
    end
      @contacts = @all.last(6).reverse.uniq
  end


  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @places = @user.places
    @message = Message.new
      if @user.dob
         @birtday = @user.dob.gsub('/', ',').split(",")
         @age = Date.current.year - @birtday[2].to_i
      else 
    end
  end

  def update 
  	@user = User.find(params[:id])
  		if @user.update_attributes(secure_params)

		  		redirect_to root_path, :notice => 'no problems'
		  else 
		  		redirect_to root_path, :alert  =>  'something went wrong'
  		end
   end

   private 

   def secure_params
   	params.require(:user).permit(:role)
   end
end

