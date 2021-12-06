class UsersController < ApplicationController
  def index
    render json: {
      user: "たくや"
    }
  end

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
