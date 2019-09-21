class FriendsController < ApplicationController

  def index
    friends = Friend.all 
    render json: friends.to_json(friend_serializer_options)
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

  end 

  def destroy

  end 

  private

  def friend_params
    params.require(:friend).permit(:name, :pronouns, :appreciation, :starred)
  end 

  def friend_serializer_options
    {
      :include => {
        :user => {
          :except => [:password_digest, :email, :created_at, :updated_at]
        },
        }, 
        :interaction => {
          :except => [:created_at, :updated_at]
        },
        :important_date => {
          :except => [:created_at, :updated_at]
        }, 
        :notes => {
          :except => [:created_at, :updated_at]
        }
      },
      :except => [:user_id, :created_at, :updated_at]
    }
  end 


end
