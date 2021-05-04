class GoalsController < ApplicationController
    before_action :require_login, only: [:create, :destroy]

    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id]

        if @goal.save
            redirect_to user_url(@goal.user_id)
        else
            flash[:errors] = ["Details can't be blank"]
            redirect_to user_url(@goal.user_id)
        end
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        if @goal && current_user.id == @goal.user_id
            @goal.delete
        end
        redirect_to users_url
    end

    private

    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
