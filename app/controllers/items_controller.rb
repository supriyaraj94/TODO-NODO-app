# FIXME: Fix N+1 queries

class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @list = List.find(params[:list_id])
    @new_item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @new_item = @list.items.new(item_params)
    @new_item.priority = @list.items.size + 1
    if @new_item.save
      redirect_to list_items_path(@list)
    else
      render :new
    end
  end

  def index
    @list = List.find(params[:list_id])
  end

  def destroy
    @olditem = Item.find(params[:id])
    Item.destroy(params[:id])
    UserMailer.welcome_email(@olditem).deliver_now
    redirect_to list_items_path(params[:list_id])
  end

  def showLists
    @item = params[:item_id]
    @lists = current_user.lists
  end

  def moveItem
    @item = Item.find(params[:item_id])
    @item.list = List.find(params[:newlist])
    @item.save
    redirect_to lists_path  
  end 

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to list_items_path(@item.list)
    else
      render :edit
    end
  end 


  def sort
    params[:order].each do |key,value|
      Item.find(value[:id].to_s).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    def item_params
      params.require(:item).permit(:title, :description , :avatar)
    end

end
