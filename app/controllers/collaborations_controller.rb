class CollaborationsController < ApplicationController
  # コラボの新規追加
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

  # youtuber_idに合致したコラボYoutuberを取得する
  def show
    collaborations = Collaboration.where(youtuber_id: params[:id])
    if collaborations
      render json: {
        collaborations: collaborations
      }
    else
      render json: {
        collaborations: "Not found"
      }
    end
  end

  # コラボ投票のカウント用
  def count_up
    collaboration = Collaboration.find(params[:id])
    collaboration.count += 1

    begin
      collaboration.save!
      render json: {countup: true}
    rescue => exception
      render json: {countup: false}
    end
  end

  private
  def collaborations_params
    params.require(:collaboration).permit(:youtuber_id, :channel_id, :count, :channel_title)
  end
end
