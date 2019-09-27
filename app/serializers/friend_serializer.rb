class FriendSerializer < ActiveModel::Serializer
   attributes :name, :id, :user_id, :appreciation
   has_many :interactions
   has_many :important_dates
   has_many :notes
end 