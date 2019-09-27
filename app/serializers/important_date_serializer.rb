class ImportantDateSerializer < ActiveModel::Serializer
  attributes :name, :id, :date, :note, :reminder, :friend_id, :user_id
  belongs_to :friend
end