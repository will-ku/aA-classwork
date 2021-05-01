class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        #user = { {username=>"username"},{password=>"pw"} }
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        # line 9 already checks for the user's pw so we don't need to check in 11
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:error] = @user.errors.full_messages
            redirect_to new_session_url
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

endo