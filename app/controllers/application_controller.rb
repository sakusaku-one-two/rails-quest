    class ApplicationController < ActionController::API
        before_action :authenticate_request, except: [:login]  # exceptを使用してloginアクションを除外
        


        def encode_jwt(user_id)
            secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
            encoded_jwt_token  = JWT.encode({id: user_id},secret_key)
            return encoded_jwt_token
        end

        def decode_jwt(raw_token)
            secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
            decoded_token = JWT.decode(raw_token,secret_key,true,algorithm: 'HS256')
            return HashWithIndifferentAccess.new(decoded_token[0])
        end

        def authenticate_request
            raw_token = cookies.signed[:jwt]
            decoded_token = decode_jwt(raw_token)
            @current_user = User.find(decoded_token[:id])
        rescue ActiveRecord::RecordNotFound,JWT::DecodeError 
            render json: {error: "ユーザーが認証されてません"},status: :unauthorized
        end
    end 
