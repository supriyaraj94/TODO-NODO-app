# FIXME: User proper indentation, 2 spaces and tabs converted to spaces
# FIXME: Use space around assignment operator
# FIXME: Fix N+1 queries
# FIXME: Enable user authentication
# OPTIMIZE: current_user is already the required user object; no need to find a user through it
# COMMENT: User underscore to name multi-worded variables
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
