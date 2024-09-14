FactoryBot.define do # FactoryBotのファクトリを定義
    factory :user do #:userという名前のファクトリを定義
        sequence(:email) {|n| "test#{n}@example.com"} #ユニークなメールアドレスを生成
        password { "password" } # 固定のパスワードを設定
    end
end
