class SessionsController < ApplicationController
  # ログインの処理を行います。if文の部分では、実際にユーザーが入力したpassword・password_confirmationの値と、DBに保存されているpassword_digestの値を比較し、合致した場合にtrueを返します。
  def login
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      login!
      render json: { logged_in: true, user: user }
    else
      render json: { status: 401, errors: ['認証に失敗しました。', '正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。'] }
    end
  end

  # ログアウトの処理を行います。
  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  # ユーザーのログイン状態をReactへ返します。current_userはログイン中のユーザーを表すインスタンス変数で、このログイン中のユーザーが存在していれば、それに応じて適切な値を返します。
  def logged_in?
    if current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false, message: 'ユーザーが存在しません' }
    end
  end

  private
  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
end
