class AvatarArtworksController < ApplicationController
  def create 
    @artwork = Artwork.find(params[:artwork_id])
    @artwork.avatar.attach(params[:avatar])
    redirect_to(artwork_path(@artwork))
  end 
end
