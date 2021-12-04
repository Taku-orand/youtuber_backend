class Api::V1::YoutubersController < ApplicationController
  def index
    render json: {
      youtubers: "たくや"
    }
  end
end
