class Notes::Show::NotesSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
end
