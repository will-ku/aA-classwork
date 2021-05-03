class GoalsController < ApplicationController
    def create
        @goal = Goal.new(goal_params)

        if logged_in?
            if @goal.save
                redirect_to user_url(current_user.id)
            else
                redirect_to user_url(current_user.id)
            end
        else
            redirect_to new_session_url
        end
    end


    def goal_params
        params.require(:goal).permit(:name, :details)
    end

    def destroy

    end

end
