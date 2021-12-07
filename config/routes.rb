Rails.application.routes.draw do
  resources :users
  resources :youtubers
  resources :favorites
  # カウントアップ
  resources :collaborations

  # コラボ　のカウント用
  get '/collaborations/countup/:id', to: 'collaborations#count_up'

  # 新規登録用
  post '/signup', to: 'registrations#signup'
  # ログイン用
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  # ユーザーのログイン状態を追跡
  get '/logged_in', to: 'sessions#logged_in?'
end
