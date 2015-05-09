class V1::UsersController < ApplicationController
  def index
    render json: User.all 
  end
  
  def show
    render json: User.find_by(email: params[:email], password: params[:password])
  end
  
  def create
    render json: User.create(user_params)
  end

  def destroy
    render json: User.find_by(email: params[:email], password: params[:password]).destroy
  end

  def update
    render json: User.find_by(email: params[:email], password: params[:password]).update(user_params)
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password)
  end
end
