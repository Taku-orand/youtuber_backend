# ここでは、React側からPOST送信されるユーザーデータをDBに保存し、その後JSONとして返り値をレンダリングしています。

# login!は、セッションを使ってユーザーをログインさせるヘルパーメソッドで、後で定義します。

# React側では、ここでレンダリングされたJSONデータを取得して扱います。
class RegistrationsController < ApplicationController
  def signup
    user = User.new(registrations_params)

    if @user.save
      login!
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
