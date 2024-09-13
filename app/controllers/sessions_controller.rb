class SessionsController < ApplicationController #ユーザーのログイン処理を行うメソッド
    
    def create 
        user = User.find_by(email: params[email])#メールアドレスでユーザーを検索
        if user && user.authenticate(params[:password]) #ユーザーが存在し、パスワードが正しい場合
            token = encode_token({user_id: user.id}) #JWTを生成
            render json: {jwt:token},status: :ok
        else
            render json: {error: '認証失敗です。'},status: :unauthorized
        end
    end

    private
    def encode_token(payload)#JWTを生成
        secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
        JWT.encode(payload,secret_key)#JWTをエンコード
    end
end
