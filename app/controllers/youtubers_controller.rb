class YoutubersController < ApplicationController
  def index
    youtubers = Youtuber.all
    render json: {
      youtubers: youtubers
    }
  end
  
  def show
    youtuber = Youtuber.find(params[:id])
    render json: {
      youtuber: youtuber
    }
  end

  def create
    new_youtuber = Youtuber.new(youtubers_params)
    begin
      new_youtuber.save!
      render json: { created: true }
    rescue => exception
      p exception
      render json: { created: false }
    end
  end

  def update
    youtuber = Youtuber.find(params[:id])
    if youtuber.update(youtubers_params)
      render json: youtuber
    else
      render json: youtuber.errors, status: 422
    end
  end

  def destroy
    youtuber = Youtuber.find(params[:id])
    begin
      youtuber.destroy!
      render json: {deleted: true}
    rescue => exception
      render json: {deleted: false}
    end
  end

  private
  def youtubers_params
    params.require(:youtuber).permit(:channel_title, :channel_id, :channel_thumbnail, :last_editor, :content)
  end
end
