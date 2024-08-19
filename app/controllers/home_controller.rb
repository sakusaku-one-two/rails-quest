class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(5)
    @tags = Tag.all
  end
end
