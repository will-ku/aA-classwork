class ArtworkSharesController < ApplicationController
    # def index
    #     artworks = Artwork.all
    #     render json: artworks
    # end

    def create
        artwork = ArtworkShare.new(artwork_shares_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = ArtworkShare.find_by(id: params[:id])
        if artwork
            artwork.destroy
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    private

    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end
