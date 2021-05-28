class Api::SessionsController < ApplicationController

  before_action :require_signed_in!, only: [:destroy]

  def new
    render :new
  end

 def create
    @user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )

    if @user.nil?
      render json: ['Nope. Wrong credentials!'], status: 401
    else
      sign_in!(@user)
      render 'api/users/show';
    end
  end

  def destroy
    @user = current_user
    if !current_user
      render json: ['No logged in user'], status: 404
    else
      sign_out!
      render json: [{}]
    end 
  end
  
end