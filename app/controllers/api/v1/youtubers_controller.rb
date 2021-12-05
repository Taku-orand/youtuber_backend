class Api::V1::YoutubersController < ApplicationController
  def index
    render json: {
      youtubers: "たくや"
    }
  end

  def create
    new_youtuber = Youtuber.new(youtubers_params)
    begin
      new_youtuber.save!
      render json: { created: true }
    rescue => exception
      render json: { created: false }
    end
  end

  private
  def youtubers_params
    params.require(:youtuber).permit(:channel_title, :channel_id, :channel_thumbnail, :last_editor, :content)
  end
end
