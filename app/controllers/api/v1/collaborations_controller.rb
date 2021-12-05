class Api::V1::CollaborationsController < ApplicationController
  def create
    new_collaboration = Collaboration.new(collaborations_params)

    begin
      new_collaboration.save!
      render json: {
        created: true
      }
    rescue => exception
      # Youtuber_idがDBにないとエラーになる
      render json: {
        created: false
      }
    end
  end

  def count_up

  end

  private
  def collaborations_params
    params.require(:collaboration).permit(:youtuber_id, :channel_id, :count, :channel_title)
  end
end
