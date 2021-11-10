class PhotosController < ApplicationController
  before_action :logged_in_user

  def index
    @photos = Photo.all
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.image.attach(params[:photo][:image])
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:user_id, :title, :image)
    end
end
