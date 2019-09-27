class InteractionsController < ApplicationController

  def index
    interactions = Interaction.all 
    render json: interactions 
  end 

  def show
    interaction = Interaction.find(params[:id])
    render json: interaction
  end 

  def create
    interaction = Interaction.create(interaction_params)
    render json: interaction
  end

  def update
  end

  def destroy
  end 

  private
  
  def interaction_params
    params.require(:interaction).permit(:date, :note, :user_id, :friend_id, :category)
  end 

end
