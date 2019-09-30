class InteractionSerializer < ActiveModel::Serializer
  attributes :id, :date, :note, :friend_id, :user_id, :category
end