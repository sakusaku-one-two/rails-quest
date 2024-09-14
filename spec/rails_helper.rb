require 'spec_helper' # RSpecの設定ファイルを読み込む
ENV['RAILS_ENV'] ||= 'test' #RAILS＿ENVが設定されていない場合、'test'をデフォルトに設定
require File.expand_path('../config/environment',__dir__) #アプリケーションの環境設定ファイルを読み込む

abort("The Rails environment is running in production mode!") if Rails.env.production? #本番環境でテストが実行されないようにする（もし本番環境であれば、エラーメッセージを表示してプログラムを終了します。）
require 'rspec/rails' #RSpecとRailsの統合を読み込む


begin 
    ActiveRecord::Migration.maintain_test_schema! #テスト用のデータベーススキーマを最新の状態に保つ
rescue ActiveRecord::PendingMigrationError => e #保持できない場合のエラーハンドリング
    puts e.to_s.strip #エラーメッセージを表示
    exit 1 #プログラムを終了
end
RSpec.configure do |config| #RSpecの設定を行う
    config.fixture_path = "#{::Rails.root}/spec/fixtures" #フィクスチャのパスを設定（フィクスチャはテストデータの事）
    config.use_transactional_fixtures = true #トランザクションフィクスチャを使用する設定（これにより、各テストがトランザクション内で実行され、テスト後にロールバックされます。
    config.infer_spec_type_from_file_location! #ファイルの場所からテストの種類を推測する設定（これにより、テストファイルの場所に基づいて適切なテストタイプが自動実行されます。
    config.filter_rails_from_backtrace! #Railsに関連するバックトレースをフィルタリングする設定（これにより、エラーメッセージが見やすくなります。）
end

