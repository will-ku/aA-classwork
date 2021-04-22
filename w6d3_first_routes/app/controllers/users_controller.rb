class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def strong_params
        params.require(:user).permit(:name, :email)
    end

    def create
        user = User.new(strong_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find_by(id: params[:id])
        if user.update(strong_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user.destroy
        else
            render json: user.errors.full_messages, status: 422
        end
    end
end