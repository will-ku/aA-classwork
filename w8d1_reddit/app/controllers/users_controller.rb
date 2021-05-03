class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit]

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to subs_url
        else
            redirect_to new_user_url
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])

        if @user && @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash[:errors] = ["Update unsuccessful."]
            redirect_to edit_user_url(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
