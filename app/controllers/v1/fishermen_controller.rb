class V1::FishermenController < ApplicationController
  def index
    render json: Fisherman.all 
  end
  
  def show
    render json: Fisherman.find(params[:id]) 
  end
  
  def create
    render json: Fisherman.create(fisherman_params)
  end

  def destroy
    render json: Fisherman.find(params[:id]).destroy
  end

  def update
    render json: Fisherman.find(params[:id]).update(fisherman_params)
  end

  private

  def fisherman_params
    params.permit(:email, :name)
  end
end
