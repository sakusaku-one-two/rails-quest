Rails.application.routes.draw do
  namespace :api do #API用の名前空間を定義 api/~でアクセス

    #ユーザー関連
    post "user/registration", to: "users#registration" #ユーザー登録
    post "user/login", to: "users#login"
    delete "user/logout/:id", to: "users#logout"
    get "user/:id/articles", to: "users#articles"

    #記事関連
    get "articles/all", to: "articles#all" #全記事を取得
    get "articles/get/:id", to: "articles#get" #指定した記事IDの記事を取得
    post "articles/create", to: "articles#create" #新規作成
    delete "articles/delete/:id", to: "articles#delete" #記事の削除 by id
    put "articles/update", to: "articles#update" #記事の更新 json bodyにidを格納している

  end
end