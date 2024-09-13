class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(5)
    @tags = Tag.all
    render json: {articles: @article,tags: @tags},status: :ok
  end
end
