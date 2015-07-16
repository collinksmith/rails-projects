class AlbumsController < ApplicationController
  before_action :require_login!

  def new
    @album = Album.new
    @album.band_id = params[:band_id]

    render :new
  end

  def create
    album_params[:year] = Date.new(album_params[:year].to_i)
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = "Successfully created album!"
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])

    render :show
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      flash[:notice] = "Sucessfully updated album."
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "#{@album.name} Deleted"
    redirect_to band_url(@album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :band_id, :recording_type)
  end
end
