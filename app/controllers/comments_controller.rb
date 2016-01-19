class CommentsController < ApplicationController
  before_filter :authenticate_user!

def new
  @item = Item.find(params[:item_id])
  end


def index
     #undefined method includes
     @item=Item.find(params[:item_id])
  end

def create
  @newcomment = Comment.new(params.require(:comment).permit(:text))
  @item=Item.find(params[:item_id])
  @item.comments << @newcomment
  redirect_to list_item_comments_path(@item.list,@item)
  end

def destroy
    @item=Item.find(params[:item_id])
    Comment.destroy(params[:id])
    redirect_to list_item_comments_path(@item.list,@item)
end

end