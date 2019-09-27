class FriendsController < ApplicationController

  def index
    friends = Friend.all
    render json: friends
  end 

  def create
    friend = Friend.create(friend_params)
    render json: friend 
  end

  def show
    friend = Friend.find(params[:id])
    render json: friend
  end 

  def update
    friend = Friend.find(params[:id])
    friend.update
    render json: friend
  end 

  def destroy

  end 

  private

  def friend_params
    params.require(:friend).permit(:name, :user_id, :pronouns, :appreciation, :starred)
  end 

  # def friend_serializer_options
  #   :include => {
  #     :bird => {:only => [:name, :species]},
  #     :location => {:only => [:latitude, :longitude]}
  #   }, :except => [:updated_at])

  # end 

end
