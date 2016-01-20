
class HomeController < ApplicationController
  def index
  end
  
  def search
  if params[:q].nil?
    @articles = []
  else
    @articles = List.search params[:q]
    render tex: @articles
  end
end

  
end

