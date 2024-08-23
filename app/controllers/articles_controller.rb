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

  def edit

      @article = Article.find_by_slug(params[:slug])
    if @article.nil?
      return :index
    end

    if request.get?
      render :edit,locals: {article: @article}
    end
  end

  #記事を更新するメソッド
  def update
    article = Article.find(params[:id])
    return redirect_to :index if article.nil?
    return redirect_to :login if @current_user.id != article.user.id
    return render :update,locals: {article:article} if request.get?

    if article.update(article_params)
      redirect_to article_path(article),notice: "更新完了しました"
    else
      render :update,locals: {article: article}
    end
  end

  def update_tags
    if params[:article][:new_tag].present?
      tag = Tag.find_or_create_by(name:params[:article][:new_tag])
      @article.tags << tag unless @article.tags.include?(tag)
    end
  end

  def remove_tag
    @article = Article.find(paramas[:id])
    tag = Tag.find(paramas[:tag_id])
    @article.tags.delete(tag)
    redirect_to edit_article_path(@article)
  end
  #新しい記事を作成するメソッド
  def create
  end

  private
  #記事のパラメーターを許可するメソッド
  def article_params
    params.require(:article).permit(:title, :body)
  end

  
end