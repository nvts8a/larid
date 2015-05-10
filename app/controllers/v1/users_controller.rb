class V1::UsersController < ApplicationController
  before_filter :ensure_authenticated_user, only: [:index]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.new_record?
      render json: { errors: user.errors.messages }, status: 422
    else
      render json: user.session_api_key, status: 201
    end
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
