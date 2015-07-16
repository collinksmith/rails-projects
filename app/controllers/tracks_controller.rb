class TracksController < ApplicationController
  before_action :require_login!

  def new
    @track = Track.new
    @track.album_id = params[:album_id]

    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:notice] = "Successfully created track!"
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])

    render :show
  end

  def edit
    @track = Track.find(params[:id])

    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      flash[:notice] = "Succesfully updated track"
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    flash[:notice] = "#{@track.name} Deleted"
    redirect_to album_url(@track.album_id)
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :song_number, :song_type, :lyrics)
  end
end
