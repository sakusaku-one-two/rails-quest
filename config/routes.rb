Rails.application.routes.draw do #routingの定義を開始
  #ルートパスを設定
  root 'articles#index' #ルートURLにアクセスしたときのにarticlescontrollerのindexアクションを呼び出す
  #　リソースベースのルーティングを設定
  resources :articles do #articles リソースのルーティングを定義
    resources :comments,only: [:create,:destroy] #ネストされたcommentsリソースのルーティングを定義
  end
  #ユーザーのルーティングを設定
  resources :users, only: [:create, :new, :show, :edit, :update] #ユーザーリソースのルーティングを定義
  
end