class CatsController < ApplicationController
  def index
    @cats = Cat.all 

  end

  def show
    @cat = Cat.find_by(id: params[:id]) 
    render :show 
  end
end
