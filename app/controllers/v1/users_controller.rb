class V1::UsersController < ApplicationController
  def index
    render json: User.all 
  end
  
  def show
    render json: User.find_by(email: params[:email], password: params[:password])
  end
  
  def create
    render json: User.create(user_params), status: 201
  end

  def destroy
    render json: User.find(params[:id]).destroy, status: 204
  end

  def update
    render json: User.find(params[:id]).update!(user_params), status: 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
