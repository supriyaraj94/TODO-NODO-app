class HomeController < ApplicationController
  def index
  end
  
  def search
    @search = Item.search params[:q]
    @items=@search.result.includes(:list, :comments)
    @search.build_condition if @search.conditions.empty?
    dfv
  end
end

  


