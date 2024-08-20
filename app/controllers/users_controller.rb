class UsersController < ApplicationController
  def index
  end

  def show 
    @user = User.find_by_username(params[:id])
    if @user
      @articles = @user.articles
    else
      redirect_to root_path , alert: "User not found"
    end

   end

  def new
  end

  def edit

  end



  def create 
    @user = User.new(user_params)
    if @user.save
      token = create_token(@user.id)
      render json: {token: token}
    else
      render json: {error: @user.errors},status: :unprocessable_entity
  end

 
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      cookies.signed[:jwt] = {value:token,httponly:true}
      redirect_to root_path,notice: 'login successful'
    else
      flash.now[:alert] = 'Invaild email or password'
      render :login
    end
  end

  private

  def encode_token(payload)
    secret_key = Rails.application.credentials.jwt_secret_key || ENV['SECRET_KEY_BASE']
    JWT.encode(payload, secret_key)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  

end




private

def user_params
  params.require(:user).permit(:email, :password)
end
end