class ItemsController < ApplicationController
def new
	@user=User.find_by(email: current_user.email)
	@list=@user.lists.find_by(id: params[:list_id])

	end

def create
	@newitem = Item.new(item_params)
	@newitem.priority=1
	@user=User.find_by(email: current_user.email)
	@list=@user.lists.find_by(id: params[:list_id])
	@list.items << @newitem
	redirect_to list_items_path(@list)
  end

def index
     @list=User.find_by(email: current_user.email).lists.find_by(id: params[:list_id])
	end	

def destroy
     @list=User.find_by(email: current_user.email).lists.find_by(id: params[:list_id])	
     @list.items.destroy(params[:id])
     redirect_to list_items_path(@list)
     end
 
private
  def item_params
    params.require(:item).permit(:title, :description)
  end  	


end
