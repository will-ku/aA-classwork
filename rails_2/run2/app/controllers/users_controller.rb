class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(params.require(:user).permit(:username, :password))
        if @user.save
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = ["Password is too short (minimum is 6 characters)"]
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])

        if logged_in?
            render :show
        else   
            redirect_to new_session_url
        end
    end

    def index
        if logged_in?
            @users = User.all
            render :index
        else
            redirect_to new_session_url
        end
    end

end
