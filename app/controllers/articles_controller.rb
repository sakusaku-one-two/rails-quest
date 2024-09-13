class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  before_action :authenticate_request, only: [:create, :update,:edit,:destroy]
  before_action :set_article, only: [:show, :edit, :update, :update_tags, :remove_tag,:destroy]

  #記事の一覧を表示するメソッド
  def index
    @articles = Article.all
    render json: @articles,status: :ok
  end

  def all_articles
    @articles = Article.all
    render json: @articles,status: :ok
  end

  #特定の記事を表示するメソッド
  def show
    render json: @article,status: :ok
  end

  def new
    @article = Article.new
  end


  def create 
    if @article.update(article_params.except(:tags))
      update_tags if params[:article][:tags].present?
      render json: @article,status: :created #記事が作成されたら返す
    else
      render json: @article.errors,status: :unprocessable_entity #エラーが発生した場合、エラーメッセージをJSON形式で返す
    end
  end
  #記事を更新するメソッド
  def update
    if @article.update(article_params.except(:tags))
      update_tags if params[:article][:tags].present?
      render json: @article,status: :ok#記事が更新された場合は、JSON形式で返す
    else
      render json: @article.errors,status: :unprocessable_entity #エラーが発生した場合、エラーメッセージをJSON形式で返す。
    end
  end

  def destroy
    @article.destroy
    head :no_content #記事が削除された場合２０４NO　Contentを返す
  end

  def edit

    return redirect_to :index if @article.nil?
    return redirect_to :login if @current_user.id != @article.user.id

    if request.get?
      render :edit, locals: { article: @article }
    end
  end


  def update_tags
    tags = params[:article][:tags].split(',').map(&:strip)
    @article.tags = Tag.where(name: tags)
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @article.tags.delete(tag)
    render json: @article,status: :ok #タグが除去されたあとの記事をJSON形式で返す
  end


  private
  #記事のパラメーターを許可するメソッド
  def article_params
    params.require(:article).permit(:title, :body, :tags)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end