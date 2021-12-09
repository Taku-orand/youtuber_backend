# Youtuberの記事用
class YoutubersController < ApplicationController
  # youtuberを全取得
  def index
    youtubers = Youtuber.all
    render json: {
      youtubers: youtubers
    }
  end
  
  # idに合致したyoutuberを取得
  # 紹介ページで使う
  def show
    youtuber = Youtuber.find(params[:id])
    render json: {
      youtuber: youtuber
    }
  end

  # youtuberを新規作成
  def create
    p youtubers_params[:channel_id]
    youtuber = Youtuber.find_by(channel_id: youtubers_params[:channel_id])
    if youtuber
      render json: { title: "すでに登録されています Youtuber一覧で確認してください" }
    end
    new_youtuber = Youtuber.new(youtubers_params)
    begin
      new_youtuber.save!
      render json: { created: true }
    rescue => exception
      p exception
      render json: { created: false }
    end
  end

  # youtuber記事の編集
  def update
    youtuber = Youtuber.find(params[:id])
    if youtuber.update(youtubers_params)
      render json: {updated: true}
    else
      render json: youtuber.errors, status: 422
    end
  end

  # youtuberを削除する
  # 今回は使わない予定
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
