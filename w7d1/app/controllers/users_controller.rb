class UsersController < ApplicationController

    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:index, :show]

    def index
        @users = User.all

        render :index
    end

    def show
        @user = User.find_by("id = #{params[:id]}") #find errors out if the id is not found
        render :show
    end

    def new 
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save # this will return false if it fails
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def edit 
        @user = User.find_by(id: params[:id])

        render :edit
    end

    def update
        user = User.find_by(id: params[:id]) #find_by returns nil when not found
        if user.update(user_params)
            # redirect_to "/users/#{user.id}"
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        # render json: "It is gone"
        redirect_to users_url
    end

    private
    # whitelisting params or strong params
    # we do this to:
    # 1. only allow the keys that we choose (a malicious user could inject their own data into the request)
    # 2. allow us to mass assign and easily add more keys
    def user_params
        params.require(:user).permit(:username, :email, :age, :political_affiliation, :password)
        # this is saying go into params look for a key of what is in the require() method and look inside that object for the keys included in permit()
    end

end