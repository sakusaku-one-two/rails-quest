module Api

    class ArticlesController < ApplicationController
        before_action :authenticate_request, except: [:all]#　すべての取得以外は必ず認証後のユーザーのみしかたたけない
        before_action :prev_get_article, except: [:all, :create]

        def all
            articles = Article.includes(:tags,:user).all  # タグを含むすべての記事を取得
            render json: articles.to_json(include: {tags:{},user:{only:[:id,:username]}}), status: :ok  # 記事とタグをJSON形式で返す
        end

        def get
            return render json: { message: '記事が存在しません' }, status: :not_found if @article.nil?  # 記事が存在しない場合のエラーメッセージ
            render json: @article.to_json(include: :tags), status: :ok  # 記事とタグをJSON形式で返す
        end

        def create
            article = Article.create!(article_params)  # 許可されたパラメータを使用して記事を作成
            render json: article.to_json, status: :created  # 作成された記事をJSON形式で返す
        end

        def delete
            article_title = @article.title
            @article.destroy  # 記事を削除
            render json: { message: "#{article_title}を削除しました。" }, status: :ok  # 削除成功のメッセージを返す
        end

        def update
            if @article.update(article_params)  # 記事を更新
                render json: @article.to_json, status: :ok  # 更新された記事をJSON形式で返す
            else
                render json: { message: "更新失敗しました。" }, status: :unprocessable_entity  # 更新に失敗した場合のエラーメッセージ
            end
        end

        private

        def prev_get_article
            @article = Article.find_by(id: params[:id])  # IDで記事を検索
        end

        def article_params
            params.require(:article).permit(:slug, :title, :description, :body, :favorited, :favoritesCount)  # 許可されたパラメータを設定
        end

        def set_params
            params.require(:article).permit(:title, :body, :tags)
        end

    end

end