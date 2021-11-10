class PhotosController < ApplicationController
  before_action :logged_in_user

  def index
    @photos = Photo.all
    @twitter_uri = twitter_uri
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

    def twitter_uri
      host = 'https://arcane-ravine-29792.herokuapp.com'
      path = '/oauth/authorize?'
      params = {
        'response_type' => 'code',
        'client_id' => '28fa91cecc903483ef240c7e9d6607d267868a05f6c1b3f59e6ea1bd5eabb74f',
        'redirect_uri' => 'http://localhost:3000/oauth/callback',
        'scope' => '',
        'state' => ''
      }
      "#{host}#{path}#{URI.encode_www_form(params)}"
    end
end
