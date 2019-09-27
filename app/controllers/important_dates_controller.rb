class ImportantDatesController < ApplicationController

  def index
    important_dates = ImportantDate.all
    render json: important_dates
  end 

  def create
    byebug
    important_date = ImportantDate.create(important_date_params)
    render json: important_date 
  end

  def show
    important_date = ImportantDate.find(params[:id])
    render json: important_date
  end

  def update
  end

  def destroy
  end


  private

  def important_date_params
    params.require(:important_date).permit(:name, :date, :user_id, :friend_id, :reminder, :note)
  end 
  
end
