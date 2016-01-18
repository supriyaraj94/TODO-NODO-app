class AdminsController < ApplicationController
    before_filter :authenticate_admin!

    
	def index
	end	

    def view
    @user = User.find_by('email': params[:email]+".com")
    if user_signed_in?
    	sign_out(current_user)
    end	
    sign_in(@user)
    redirect_to lists_path
    end    

end

