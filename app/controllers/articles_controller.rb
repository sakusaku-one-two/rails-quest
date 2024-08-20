class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  before_action :authenticate_user,only:[:create,:update]
  #記事の一覧を表示するメソッド
  def index
    @articles = Article.all
  end

  #特定の記事を表示するメソッド
  def show
    @article = Article.find_by_slug(params[:slug])
  end

  #記事を更新するメソッド
  def update
    article = Article.find_by_slug(paramas [:slug])
    return redirect_to :index if article.nil?
    return redirect_to :login_path if @current_user.id != article.user.id

    return render :update,locals: {article:article} if request.get?

    if article.update(article_params)
      redirect_to article_path(article),notice: "更新完了しました"
    else
      render :update,locals: {article: article}
    end
  end

  #新しい記事を作成するメソッド
  def create
  end

  private
  #記事のパラメーターを許可するメソッド
  def article_params
    params.require(:article).permit(:title, :body)
  end

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