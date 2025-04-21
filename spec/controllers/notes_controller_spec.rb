require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:notes) { create_list(:note, 3) }
  let(:note) { create(:note) }
  let(:new_note) { attributes_for(:note, content: "new note for POST test") }

  describe "GET#index" do
    context "when the notes are listed" do
      before do
        notes

        get :index
      end

      it "must return 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "must return the first note attributes" do
        expect(json_body[0]).to include(:id, :content)
      end
    end
  end

  describe "GET#show" do
    context "when a note is selected" do
      before do
        note

        get :show, params: { id: note.id }
      end

      it "must return 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "must return selected note attributes" do
        expect(json_body).to include(:id, :content)
      end
    end
  end

  describe "POST#create" do
    context "when a new note is created" do
      before do
        new_note

        get :create, params: { note: new_note }
      end

      it "must return 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "must return the new note attributes" do
        expect(json_body).to include(:id, :content)
      end
    end
  end

  describe "DELETE#destroy" do
    context "when a note is deleted" do
      before do
        notes

        delete :destroy, params: { id: notes.last.id }
      end

      it "must return 204 status code" do
        expect(response).to have_http_status(:no_content)
      end

      it "must to verify if the note was removed" do
        expect(Note.count).to eq(2)
      end
    end
  end
end
