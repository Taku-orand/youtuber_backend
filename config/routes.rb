Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :youtubers
      resources :collaborations
      resources :favorites
    end
  end

  # 新規登録用
  post '/signup', to: 'registrations#signup'
  # ログイン用
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  # ユーザーのログイン状態を追跡
  get '/logged_in', to: 'sessions#logged_in?'
end
