# FIXME: User proper indentation, 2 spaces and tabs converted to spaces
# FIXME: Use space around assignment operator
# FIXME: Fix N+1 queries
# FIXME: Enable user authentication
# OPTIMIZE: current_user is already the required user object; no need to find a user through it
# COMMENT: User underscore to name multi-worded variables
class ItemsController < ApplicationController
def new
  @list = List.find(params[:list_id])
  end

def create
  @newitem = Item.new(item_params)
  @newitem.priority=1
  @list=List.find(params[:list_id])
  #add errors here
  @list.items << @newitem
  redirect_to list_items_path(@list)
  end

def index
     @list=List.find(params[:list_id])
  end

def destroy
    Item.destroy(params[:id])
    redirect_to list_items_path(params[:list_id])
end

def showLists
    @item=params[:item_id]
    @lists=current_user.lists
end

def moveItem
    @item=Item.find(params[:item_id])
    @item.list=List.find(params[:newlist])
    @item.save
    render plain: "Ok"
end  

private
  def item_params
    params.require(:item).permit(:title, :description)
  end


end
