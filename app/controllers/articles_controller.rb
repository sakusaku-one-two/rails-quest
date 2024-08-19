class ArticlesController < ApplicationController
  #記事の一覧を表示するメソッド
  def index
    @articles = Article.all
  end

  #特定の記事を表示するメソッド
  def show
  end

  #記事を更新するメソッド
  def update
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