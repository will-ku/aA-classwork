class GoalsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create 
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]

    flash[:errors] = @goal.errors.full_messages unless @goal.save 

    redirect_to user_url(@goal.user_id)
  end

  def destroy 
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy if @goal.user_id == current_user.id 
    redirect_to users_url
  end
 
  private 
  def goal_params
    params.require(:goal).permit(:status, :name, :details)
  end
end
