class V1::ActivitiesController < ApplicationController
  def index
    render json: Activity.where(user_id: params[:user_id])
  end
  
  def show
    render json: Activity.find(params[:id])
  end
  
  def create
    params[:activity][:user_id] = params[:user_id]
    render json: Activity.create(activity_params)
  end

  def destroy
    render json: Activity.find(params[:id]).destroy
  end

  def update
    render json: Activity.find(params[:id]).update(activity_params)
  end

  private

  def activity_params
    params.require(:activity).permit(:user_id, :latitude, :longitude)
  end
end
