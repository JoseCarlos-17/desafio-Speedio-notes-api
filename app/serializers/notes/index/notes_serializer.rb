class Notes::Index::NotesSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
end
