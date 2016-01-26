class MasterController < ApplicationController
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



  def exportData
    @lists =List.all
    respond_to do |format|
      format.html
      format.csv { send_data @lists.as_csv }
    end
  end


  def formatData
  end

  def search
    @search = Item.search params[:q]
    @search.sorts = ['title asc']
    @items=@search.result.includes(:list, :comments)
    @search.build_condition if @search.conditions.empty?

  end
           
end

