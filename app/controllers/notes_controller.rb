class NotesController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy, :edit]

  def new
    @note = note.new

    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
      flash[:notice] = "Note successfully saved."
    else
      flash[:errors] = @note.errors.full_messages
    end

    redirect_to track_url(@note.track_id)
  end

  def edit
    @note = Note.find(params[:id])

    render :edit
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      flash[:notice] = "Successfully updated note"
    else
      flash[:notice] = @note.errors.full_messages
    end

    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find(params[:id])
    track_id = @note.track_id
    @note.destroy!

    redirect_to track_url(track_id)
  end

  private

  def note_params
    params.require(:note).permit(:text, :track_id)
  end

  def ensure_correct_user
    note = Note.find(params[:id])
    unless current_user.id == note.user_id
      render text: "You can't edit or delete a note you didn't create.",
      status: 403
    end
  end
end
