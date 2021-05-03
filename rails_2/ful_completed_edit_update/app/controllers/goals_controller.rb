class GoalsController < ApplicationController
  before_action :require_login 

  def create 
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]

    flash[:errors] = ["Details can't be blank"] unless @goal.save 
    redirect_to user_url(@goal.user_id )
  end

  def destroy 
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy if current_user.id == @goal.user_id 
    redirect_to users_url
  end

  def edit 
    @goal = Goal.find_by(id: params[:id])
    render :edit 
  end

  def update 
    @goal = Goal.find_by(id: params[:id])

    if @goal && @goal.update(goal_params) 
      redirect_to user_url(@goal.user_id)
    else
      flash[:errors] = ["Details can't be blank"]
      render :edit 
    end
  end


  private 
  def goal_params 
    params.require(:goal).permit(:name, :details, :status)
  end
end
