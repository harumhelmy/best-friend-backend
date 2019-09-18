class UsersController < ApplicationController

  # do we even need this 
  def index
    users = User.all 
    render json: users, except: [:password_digest, :email]
  end 

  def show
  end 

  def create
  end

  def update
  end

  # def destroy
  # end

  private

  def user_params
    
  end
  
  def user_serializer_options
    # gotta include friends and probably last interaction here, include friend name and interaction.last or something like that? 

    # for the reminder and countdown, will have to fetch from important_dates and interactions 
  end 

end
