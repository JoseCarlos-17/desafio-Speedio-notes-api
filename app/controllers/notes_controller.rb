class NotesController < ApplicationController
  before_action :find_selected_note, only: %i[show destroy]
  # after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    notes = Note.all.order(created_at: :desc)

    # @pagy, notes = pagy(notes)

    render json: notes,
           each_serializer: Notes::Index::NotesSerializer,
           status: :ok
  end

  def update
    note = Note.find(:id)

    note.update(note_params)

    head :no_content
  end

  def create
    new_note = Note.create!(note_params)

    render json: new_note,
           serializer: Notes::Create::NotesSerializer,
           status: :created
  end

  def show
    render json: find_selected_note,
           serializer: Notes::Show::NotesSerializer,
           status: :ok
  end

  def destroy
    find_selected_note.destroy!

    head :no_content
  end

  private

  def find_selected_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
