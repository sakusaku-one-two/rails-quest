class ApplicationController < ActionController::Base

    def authenticate_user
        token = cookies.signed[:jwt]
        puts 'tokenはあるかな'
        puts token
        if token
          begin 
            decoded_token = JWT.decode(token,Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE'])[0]
            @current_user = User.find(decoded_token['user_id'])
            
          rescue JWT::DecodeError
            redirect_to login_path, alert: 'ログインしてください。'
          end
        else
          redirect_to login_path, alert: 'ログインしてください。'
        end
      end
end
