class PhotosController < ApplicationController
    before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params.merge(place_id: @place, user: current_user))
      redirect_to place_path(@place)

  end

  def show
    @photo = Photo.find(params[:place_id])
    @photo.captions.create(caption_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :picture, :place_id)
  end
end
