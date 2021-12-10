class FavoritesController < ApplicationController
  # お気に入り登録
  def create
    new_favorite = Favorite.new(favorites_params)
    begin
      new_favorite.save!
      render json: {
        created: true
      }
    rescue => exception
      render json: {
        created: false
      }
      p exception
    end
  end

  # お気に入り削除
  def destroy
    favorite = favorites_params
    favorite = Favorite.find_by(user_id: favorite.user_id, youtuber_id: favorite.youtuber_id)
    favorite.destroy
  end

  #　お気に入り表示
  def show
    user = User.find(params[:id])
    youtubers = user.youtubers

    favorites = Favorite.where(user_id: user.id).pluck(:youtuber_id)  # ユーザーのお気に入りのyoutuber_idカラムを取得
    favorite_list = Youtuber.find(favorites)     # youtubersテーブルから、お気に入り登録済みのレコードを取得
    render json: {
      favorite_list: favorite_list
    }
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def favorites_params
    params.require(:favorite).permit(:user_id, :youtuber_id)
  end
end
