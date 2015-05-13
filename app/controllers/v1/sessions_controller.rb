class V1::SessionsController < ApplicationController
  def create
    require 'pry'; binding.pry
    user = User.where("email = ? AND password = ?", params[:user][:email], params[:user][:password]).first

    if user
      render json: user.session_api_key, status: 201
    else
      render json: {}, status: 401
    end
  end
end
