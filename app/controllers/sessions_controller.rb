class SessionsController < ApplicationController
    def create 
        user = User.find_by(email: params[email])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {jwt:token},status: :ok
        else
            render json: {error: '認証失敗です。'},status: :unauthorized
        end
    end

    private
    def encode_token(payload)
        secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
        JWT.encode(payload,secret_key)
    end
end
