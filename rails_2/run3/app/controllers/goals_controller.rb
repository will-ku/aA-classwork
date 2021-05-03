class GoalsController < ApplicationController
    before_action :require_login

    def create
        @goal = Goal.new(goal_params)

        @goal.user_id = params[:user_id]

        if @goal.save
        else
            flash[:errors] = @goal.errors.full_messages
        end
        #  we are redirecting to the same url no matter what
        redirect_to user_url(@goal.user_id)
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        if current_user.id == @goal.user_id
            @goal.delete
            redirect_to users_url
        end

    end

    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end

end
