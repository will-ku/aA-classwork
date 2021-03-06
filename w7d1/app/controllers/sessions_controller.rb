class SessionsController < ApplicationController

    def new
        # redirect_to new_session_url
        render :new
        # new renders our "new" template
        # Session#new is the login page
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            login(@user)
            redirect_to user_url(@user)
        else
            redirect_to new_session_url
        end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end

    # def log_out
    #     current_user.reset_session_token! if logged_in?
    #     session[:session_token] = nil
    #     @current_user = nil
    # end

end