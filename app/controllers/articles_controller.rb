class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  before_action :authenticate_user,only:[:create,:update]
  before_acrion :set_article,only:[:show,:edit,:update,:update_tags,:remove_tag]


  #記事の一覧を表示するメソッド
  def index
    @articles = Article.all
  end

  #特定の記事を表示するメソッド
  def show
  end

  def edit

     return redirect_to :index if @article.nil?

     if request.get?
      render :edit,locals: {article: @article}
    end
  end

  #記事を更新するメソッド
  def update
    return redirect_to :index if @article.nil?
    return redirect_to :login if current_user.id != @article.user.id
    return render :update, locals: {article: @article} if request.get?


    if @article.update(article_params.except(:tags))
      update_tags if params[:article][:tags].present?
      redirect_to article_path(@article),notice: "更新完了しました"
    else
      render :update,locals: {article: @article}
    end
  end

  def update_tags
    tag = Tag.find(params[:tag_id])
    @article.tags.delete(tag)
    redirect_to edit_article_path(@article)
  end

  def remove_tag
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
    params.require(:article).permit(:title, :body,:tags)
  end

  def set_article
    @article = Article.find(params[:id])
  end
  
end