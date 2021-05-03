class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            
        else
            redirect_to users_url
        end
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end

end
