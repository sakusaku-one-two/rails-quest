Rails.application.routes.draw do
  namespace :api do #API用の名前空間を定義 api/~でアクセス

    #ユーザー関連
    post "user/registration", to: "users#registration" #ユーザー登録
    post "user/login", to: "users#login"
    post "user/logout", to: "users#logout"
    delete "user/article/delete",to: "users#article_delete"#headerにarticle-idを格納
    post "user/article/create",to: "users#article_create"
    get "user/articles", to: "users#articles"
    

    #記事関連
    get "articles/all", to: "articles#all" #全記事を取得
    get "articles/get/:id", to: "articles#get" #指定した記事IDの記事を取得
    post "articles/create", to: "articles#create" #新規作成
    put "articles/update", to: "articles#update" #記事の更新 json bodyにidを格納している

    #タグ関連
    delete "tags/delete",to: "tags#delete"
    post "tags/insert",to: "tags#insert_article_tag"
    post "tags/create",to: "tags#create_tag"
    
  end
end