# Add a show action
class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list, only: [:edit, :update]

  def index
    # TODO: Add search, sorting and pagination
    @lists = current_user.lists.includes(:items)
  end

  def new
  end

  def create
    @new_list = current_user.lists.new(list_params)
    if @new_list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to lists_path
    else
      # TODO: According to the page this action is called from
    end
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end

    def set_list
      @list = List.find(params[:id] || params[:list_id])
    end
end

