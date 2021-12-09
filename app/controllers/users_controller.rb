#ログイン関連用
#ただし、使用していない
class UsersController < ApplicationController
  def create
    new_user = User.new(users_params)
    begin
      new_user.save!
      render json: {
        created: true,
        isLogin: true,
      }
    rescue => exception
      render json: { 
        created: false,
        isLogin: false
      }
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :password, :email, :introduction)
  end
end
