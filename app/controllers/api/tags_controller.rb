module Api
    class TagController < ApplicationController
        before_action :authenticate_request

        def create_tag  
            new_tag = Tag.create!(create_pamams)
            if new_tag    
                render json: {new_tag.to_json},status: :ok
            else
                render json: {message: "作成できませんでした"},status: :nothing
            end
            rescue ActiveRecord::Invalid => e 
                render json: {message: e.message},status: :nothing
        end

        def insert_article_tag
            tag_params = params.permit(:on_article).require(:article_id,tag_id)
            article_id = tag_params[:article_id]
            if @current_user.artcles.exists?(article_id)
                new_article_tag = ArticleTag.create!(tag_params)
               return render json: {new_article_tag.to_json},status: :ok unless new_article_tag.nil?
            else
                return render json: {message:"中間テーブルのタグと記事を接続・登録できませんでした"},status: :RecordNotFound
            end

            rescue ActiveRecord::Invalid =>e 
                render json: {message: e.message},status: :RecordNotFound
            
        end
        private
        def create_pamams
            params.permit(:tags).require( :tag_id,:title)
        end 


    end
end
