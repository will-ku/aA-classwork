class CatsController < ApplicationController
  before_action :owner?, only: [:edit, :update]

  def owner?
    if !self.user_id == current_user.id
      # render plain: "not your cat"
      redirect_to cats_url
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
    @cat = Cat.new(cat_params, @current_user.id = :user_id)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.where("self.id = #{params[:id]}")
    # @cat = Cat.find_by(params[:id])
    render :edit
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

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
