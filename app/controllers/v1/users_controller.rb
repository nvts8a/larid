class V1::UsersController < ApplicationController
  def index
    render json: User.all 
  end
  
  def show
    render json: User.find(params[:id]) 
  end
  
  def create
    render json: User.create(user_params)
  end

  def destroy
    render json: User.find(params[:id]).destroy
  end

  def update
    render json: User.find(params[:id]).update(user_params)
  end

  private

  def user_params
    params.permit(:email, :name)
  end
end
