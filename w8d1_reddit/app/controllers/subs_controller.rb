class SubsController < ApplicationController
    before_action :require_moderator_access, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        render :new
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end
    
    def require_moderator_access
        return if current_user.subs.find_by(id: params[:id])
        flash[:errors] = ["You do not have mod permissions to update this sub."]
        redirect_to subs_url
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end
    
    def create
        @sub = Sub.new(sub_params)
        
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = ["Sub was not created"]
            redirect_to subs_url
        end
    end
    
    def update
        @sub = Sub.find_by(id: params[:id])
        
        if @sub && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = ["Sub was not updated"]
            redirect_to sub_url(@sub)
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
