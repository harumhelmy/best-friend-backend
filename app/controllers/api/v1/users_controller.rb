class Api::V1::UsersController < ApplicationController

  # TODO: SERIALIZE 
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user.to_json(user_serializer_options), status: :created
    else 
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  # do we even need this 
  def index
    users = User.all 
    render json: users.to_json(user_serializer_options)
  end 

  def show
    user = User.find(params[:id])
    render json: user.to_json(user_serializer_options)
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
        :friends => {
          :except => [:created_at, :updated_at]
        }
      }, 
      :except => [:password_digest, :email, :created_at, :updated_at]
    }
    #  gotta include friends and probably last interaction here, include friend name and interaction.last or something like that? 

    # for the reminder and countdown, will have to fetch from important_dates and interactions 
  end 

end
