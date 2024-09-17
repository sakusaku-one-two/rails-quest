module Api

    class UsersController < ApplicationController
        before_action :authenticate_request, except: [:login,:registration]
        
        # t.string "username"
        # t.string "email"
        # t.string "password_digest", null: false
        # t.string "bio"
        # t.string "image"
        # t.boolean "following"
        # t.datetime "created_at", null: false
        # t.datetime "updated_at", null: false
        # t.index ["email"], name: "index_users_on_email", unique: true
      

        
        def registration
            @current_user = User.new(create_user_params)
            if @current_user.save
               return setup_jwt_into_cookie(@current_user.id)
            else
                return render json: {errors: @current_user.errors.full_messages},status: :unauthorized
            end
        end

        def login
            login_params = params[:user]
            user = @current_user || User.find_by(email: login_params[:email])
            if user && user.authenticate(login_params[:password])
                @current_user = user
                return setup_jwt_into_cookie(user.id)
            else
                render json: {error: "ログインに敗しました。",email:params[:user][:email],password:login_params[:password]},status: :unauthorized
            end     
            
        end

        def logout
            cookies.delete(:jwt,path:'/')
            render json: {message: "ログアウトしました。"},status: :ok
        end

        def articles
            my_articles = @current_user.articles.includes(:tags) # 'artcles'を'articles'に修正
            render json: my_articles.to_json(include: :tags), status: :ok #記事とタグをJSON形式で返す
        end

        def article_create
            params_data = article_params
            params_data[:user_id] = @current_user.id
            article = Article.create!(params_data)
            return render json: {article: article.to_json},status: :ok
            rescue ActiveRecord::RecordInvalid => e 
                return render json: {message: e.message},status: :bad_request
            
        end


        #delete "user/article/delete",to: "users#article_delete"#headerにarticle-idを格納
        def article_delete
            article_id = request.headers['Article-ID']#headerから取得
            return render json:{message: "ヘッダーにIDがありません。"},status: :bad_request if article_id.nil?

            article = @current_user.articles.find(article_id)
            return render json: {message: '記事が削除されました。'},status: :ok if article.destroy
            
            return render json: {message: "削除が失敗しました。"},status: :bad_request
        end

        private
        def setup_jwt_into_cookie(user_id)
            token = encode_jwt(user_id) # 'user.id'を'user_id'に修正
            cookies.signed[:jwt] = {value: token,
                                    httponly:true,#javascriptからアクセスできないようにする。
                                    secure: false,#本番環境ではHTTPSのみ送信
                                    expires: 1.hour.from_now,#１時間でJWTが消える
                                    path: '/', #クッキーが有効なパスをルートに設定
                                    same_site: :lax # SameSite属性を:laxに変更
                                    }
            # cookies.signed[:jwt] = token
            render json: {username: @current_user.username,token:token}, status: :ok # 'user.name'を'@current_user.username'に修正
        end

        def require_user_params  
            params.require(:user).permit(:email, :password, :password_confirmation) # 'passowrd'を'password'に修正
        end

        def create_user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :image) # 'emial'を'email'に修正
        end

        def article_params
            params.require(:article).permit(:slug, :title, :description, :body, :favorited, :favoritesCount)  # 許可されたパラメータを設定
        end
        
    end

end