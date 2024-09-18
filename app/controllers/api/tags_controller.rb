module Api
    class TagsController < ApplicationController
        before_action :authenticate_request
                
        def get_all
            render json: Tag.all.to_json,status: :ok
        end

        def create_tag  
            new_tag = Tag.create!(name: params[:name])
            if new_tag    
                render json: new_tag.to_json,status: :ok
            else
                render json: {message: "作成できませんでした"},status: :nothing
            end
            rescue ActiveRecord::Invalid => e 
                render json: {message: e.message},status: :nothing
        end

        
        def insert_article_tag
            article_id = params[:article_id]
            tag_id = params[:tag_id]

            if @current_user.articles.exists?(id: article_id)
                new_article_tag = ArticleTag.create!(article_id: article_id,tag_id: tag_id)
               return render json: new_article_tag.to_json,status: :ok unless new_article_tag.nil?
            else
                return render json: {message:"中間テーブルのタグと記事を接続・登録できませんでした"},status: :RecordNotFound
            end

            rescue ActiveRecord::RecordInvalid =>e 
                render json: {message: e.message},status: :RecordNotFound
            
        end
        
        def delete
            target_params = params.permit(:article).require(:article_id,:tag_id)
            article_id = target_params[:article_id]

            unless @current_user.articles.exists?(article_id)
                return render json: {message: "対象となる記事が見つかりませんでした"},status: :RecordNotFound1
            end

            tag_id = target_params[:tag_id]
            
            return render json: {message: "対象となるタグが見つかりません。"},status: :RecordNotFound unless @current_user.articles.tags.exists?(tag_id)
            
            target_article.tags.delete(target_tag)
            render json: {message: "削除が完了しました。"},status: :ok
        end
        
        private
        def create_pamams
            params.permit(:tags).require( :tag_id,:title)
        end 


    end
end
