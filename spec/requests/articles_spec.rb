require 'rails_helper' #RSpecとRailsの設定ファイルを読み込む

RSpec.describe "Articles API",type: :request do #Aritcles APIのリクエストスペックを定義
   
    describe "GET/articles" do #ＧＥＴリクエストのテストを定義
        it "returns a list of aritcles" do #記事のリストが返されるかをテスト
            create_list(:aritcle,3) #FactoryBotを使って3つの記事を作製

            get '/articles' #/articlesエンドポイントにGETリクエストを送信

            expect(response).to have_http_status(:ok) #ステータスレコードが200が返されることを確認
            expect(JSON.parse(response.body).size).to eq(3)#レスポンスボディのサイズが3であることを確認
        end
    end

    describe "POST /articles" do #POSTリクエストのテストを定義
        it "create a new article" do #新しい記事が作成されるのをテスト
            article_params = {article: {title: "New Article",body:"This is a new artcle."}} #新しい記事のパラメーターを定義
            post '/articles',params: article_params #/articles エンドポイントにPOSTリクエストを送信
            expect(response).to have_http_status(:created)#ステータスコード201が返される事を確認
            expect(JSON.parse(response.body)['id']).to eq(artcle.id)#レスポンスボディのタイトルがNEWArticleであることを確認
        end 
    end
    
    describe "PUT /articles/:id" do #特定の記事を更新するリクエストの定義
        it "updates the specified article" do #指定された記事が更新されるかをテスト
            artcle = create(:artcle) #FactoryBotを使って記事を作製
            updated_params = {artcle: {title: "Updated Title"}} #更新するパラメーター
            
            put "/articles/#{artcle.id}",params: updated_params #/articles/:idエンドポイントにＰＵＴリクエストを送信

            expect(response).to have_http_status(:ok)#ステータスコード200が返されることを確認
            expect(article.reload.title).to eq("Updated Title") #記事のタイトルが更新されたことを確認
        end
    end

    describe "DELETE /articles/:id" do #特定の記事を削除するDELETEリクエストのテストを定義
        it "deletes the specified article" do #指定された記事が削除されるかをテスト
            article = create(:article) #FactoryBotを使って記事を作製
            delete "/articles/#{article.id}" #articles/:idエンドポイントにDELETEリクエストを送信

            expect(response).to have_http_status(:no_content)#ステータスコードが204が返される事をお確認
            expect(Article.exists?(artcle.id)).to be_falsey #記事が削除されたことを確認
        end 
    end

 
end

