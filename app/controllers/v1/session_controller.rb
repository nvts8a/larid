class V1::SessionController < ApplicationController
  def create
    user = User.where("email = ? AND password = ?", params[:email], params[:password]).first
    if user
      render json: user.session_api_key, status: 201
    else
      render json: {}, status: 401
    end
  end
end
