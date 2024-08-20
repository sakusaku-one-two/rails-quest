class UsersController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  # JSONリクエストの場合、CSRF保護を無効にする
  def show
    puts params[:id]
    @user = User.find_by(username: params[:id])
    @articles = Article.where(user_id: @user.id)
    render :show
  end

  def login
    if request.get?
      return render :login
    end

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      cookies.signed[:jwt] = { value: token, httponly: true }

      
       render json: { jwt: token, message: 'login successful' , status: :ok }
      
    else
     
       render json: { error: 'Invalid email or password' , status: :unauthorized,email: params[:email],password: params[:password] }
      
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end

 
  def encode_token(payload)
    secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
    JWT.encode(payload, secret_key)
  end
end