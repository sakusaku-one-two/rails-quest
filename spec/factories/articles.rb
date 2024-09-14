

FactoryBot.define do #FactoryBotのファクトリを定義
    factory :article do #:articleという名前のファクトリを定義
        title {"Sample Title"} #記事のタイトルを設定
        description {"Sample Description"} #記事の説明を設定
        body {"Sample body"} #記事の本文を設定
        association :user #ユーザーとの関連を設定
        after(:create) do |article| #記事作成後にタグを追加
            article.tags << create(:tag) #タグを追加
        end
    end
end