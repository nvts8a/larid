require 'pry'

class V1::FishController < ApplicationController
  def index
    render json: Fish.where(fisherman_id: params[:fisherman_id])
  end
  
  def show
    render json: Fish.find(params[:id])
  end
  
  def create
    render json: Fish.create(fish_params)
  end

  def destroy
    render json: Fisherman.find(params[:id]).destroy
  end

  def update
    render json: Fisherman.find(params[:id]).update(fish_params)
  end

  private

  def fish_params
    params.permit(:catch_time, :fisherman_id, :latitude,
                  :length, :longitude, :sex, :species, :weight)
  end
end
