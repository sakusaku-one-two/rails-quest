class Article < ApplicationRecord
    #ArticleクラスはAPPLICATIONRECORDを継承しています。
    #これにより、ArticleクラスはActiveRecordの機能を利用できます。
    belongs_to :user
    #ArticleはAuthorに属しています。
    #これは、各記事が一人の著者に関連付けられていることを意味しています。
    has_many :article_tags
    #Articleは多くのArticleTagを持っています。
    #これは、中間テーブルを通じて多対多の関係を実現するための設定です。
    has_many :tags, through: :article_tags
    #Articleは多くのTagを持っています。
    #これは、article_tagsテーブルを通じて多対多の関係を実現します。
end