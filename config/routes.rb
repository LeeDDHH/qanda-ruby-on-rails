Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/index', to: "users#index"
  get 'users', to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
  # 質問のルーティング設定
  # 質問に紐づく回答のルーティング設定
  resources :questions do
    resources :answers
  end
end
