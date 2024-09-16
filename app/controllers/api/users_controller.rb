module Api

    class UsersController < ApplicationController
        before_action authenticate_request, except [:login,:registration]
        
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
            user = @current_user || User.find_by(email:params[:email])
            if user && user.authenticate(params[:password])
                return setup_jwt_into_cookie(user.id)
            else
                render json: {error: "ログインに失敗しました。"},status: :unauthorized
            end 
            
        end

        def logout

        end

        def articles

        end

        private

        def setup_jwt_into_cookie(user_id)
            token = encode_jwt({id: user.id})
            cookies.signed[:jwt] = {value: token, httponly:true}#本番では追加でsecure: trueにする必要がある　これを行うとHTTPSでのみ送信される
            return render json: {username: user.name},status: :ok
        end

        def require_user_params  
            return params.require(:user).permit(:email,passowrd: password_confirmation)    
        end

        def create_user_params
            params.require(:user).permit(:username, :emial, :password, :password_confirmation, :bio, :image)
        end

        
    end

end