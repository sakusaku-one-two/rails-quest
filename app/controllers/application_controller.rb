class ApplicationController < ActionController::API
    before_action :authenticate_request #各リクエストの前に認証を行う

    
    # def authenticate_user
    #     token = cookies.signed[:jwt]
    #     puts 'tokenはあるかな'
    #     puts token
    #     if token
    #       begin 
    #         decoded_token = JWT.decode(token,Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE'])[0]
    #         @current_user = User.find(decoded_token['user_id'])
            
    #       rescue JWT::DecodeError
    #         redirect_to login_path, alert: 'ログインしてください。'
    #       end
    #     else
    #       redirect_to login_path, alert: 'ログインしてください。'
    #     end
    #   end

    private 
    def authenticate_request
      header = request.headers['Autorization'] #リクエストヘッダーからAuthorizationヘッダーを取得
      header = header.split(' ').last if header #ヘッダーからトークン部分を抽出
      decode = decode_token(header) #トークンをデコード
      @current_user = User.find(decoded[:user_id]) if decode #デコードしたユーザーIDでユーザーを検索
    rescue ActiveRecord::RecordNotFound,JWT::DecodeError #ユーザーが見つからない場合やトークンのデコードに失敗した場合、Unauthorizedエラーメッセージを返す
      render json: {error: 'Unauthorized'},status: :unauthorized
    end

    def decode_token(token)
      secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']#秘密鍵を取得
      decode = JWT.decode(token,secret_key,true, algorithm: 'HS256')#トークンをデコード
      HashWithIndifferentAccess.new(decode[0])#デコードしたペイロードをハッシュに変換
    end
end
