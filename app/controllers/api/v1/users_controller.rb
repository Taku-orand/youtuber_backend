class Api::V1::UsersController < ApplicationController
  def index
    render json: {
      user: "たくや"
    }
  end
end
