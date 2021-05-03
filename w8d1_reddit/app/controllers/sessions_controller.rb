class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user.save
            redirect_to subs_url
        else
            flash[:errors] = ["something wong"]
            redirect_to new_session_url
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end
end
