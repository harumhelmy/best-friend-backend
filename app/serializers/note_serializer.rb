class NoteSerializer < ActiveModel::Serializer
  attributes :content, :user_id, :friend_id
  belongs_to :friend
end
