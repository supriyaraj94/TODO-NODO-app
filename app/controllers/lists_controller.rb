class ListsController < ApplicationController
	def index
     @lists=User.find_by(email: current_user.email).lists
	end	

	def new
	end
	
	def create
	@newlist = List.new(params.require(:list).permit(:title, :description))
	@user=User.find_by(email: current_user.email)
	@user.lists << @newlist
	redirect_to lists_path
	end	

	def edit
    @list = User.find_by(email: current_user.email).lists.find_by(id: params[:id])
	end	

	def update
     @list = User.find_by(email: current_user.email).lists.find_by(id: params[:id])
     @list.update(list_params)
     redirect_to lists_path	
    end

    private
  def list_params
    params.require(:list).permit(:title, :description)
  end

end

