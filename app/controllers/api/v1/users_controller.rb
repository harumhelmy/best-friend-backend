class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user.to_json(user_serializer_options), status: :created
    else 
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def index
    users = User.all 
    render json: users 
  end 

  def show
    user = User.find(params[:id])
    render json: { user: user, friends: user.friends }
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
  
  def user_serializer_options
    {
      :include => {
        :friends => { :include => {
          :interactions => { :except => [:created_at, :updated_at] },
          :notes => { :except => [:user_id]},
          :important_dates => { :except => [:created_at, :updated_at] }
        },
          :except => [:created_at, :updated_at]
        }
      }, 
      :except => [:password_digest, :email, :created_at, :updated_at]
    }
  end 

end