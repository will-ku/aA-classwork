class CatsController < ApplicationController
  before_action :set_current_cat
  before_action :owner?, only: [:edit, :update]
  

  def owner?
    # render json: Cat.find_by(id: params[:id])
    # return
    if !current_cat.user_id == current_user.id
      render :index
      # render plain: "not your cat"
      # redirect_to cats_url
      # cat.errors.full_messages
    end
  end 

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params) #, @current_user.id = :user_id)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find[params[:id]]
    # @cat = current_user.cats.where("current_cat.id = #{params[:id]}")
    render json: "#{@cat}"
    # @cat = Cat.find_by(params[:id])
    # render :edit
  end

  def update
    @cat = current_user.cats.where("self.id = #{params[:id]}")
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end
  
  def current_cat
    @current_cat
  end

  def set_current_cat
    @current_cat = Cat.find_by(id: params[:id])
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
