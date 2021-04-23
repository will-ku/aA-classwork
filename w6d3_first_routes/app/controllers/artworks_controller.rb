class ArtworksController < ApplicationController
    def index
        if params.has_key?(:artist_id)
            artworks = Artwork.where(artist_id: params[:artist_id])
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            artwork.destroy
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end