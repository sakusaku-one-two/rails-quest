require_relative "boot"
#boot.rbファイルをよみこみます。boot.rbはアプリケーションの初期設定を行うファイルです。

require "rails/all"
#rialsのすべてのファイルを読み込みます。これにはActiveRecordやActionControllerなどの主要なコンポーネントが含まれています。
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
#GemfileにリストされているGemを読み込みます。:test,:development,:producationの各グループに限定されたGemも含まれます。

module ConduitClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))#.rbファイルを含まない、またはロードやイーガーロードが不要なLIBサブディレクトリをignoreリストに追加
    #一般的な例としては、templates, generaters,middlewareなど




    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.api_only = true #APIモードに設定
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use Rack::Cors do
      allow do #許可する設定を開始
        origins '*'#全てのオリジンからのリクエストを許可
        resource '*',#すべてのリソースに対して
          headers: :any,#任意のヘッダを許可
          methods: [:get,:post, :put, :patch,:delete,:options,:head] #許可するHTTPメソッドをしてい
      end 
    end

    # config.middleware.delete ActionDispatch::Session::CookieStore #不要なミドルウェアを削除
    # config.middleware.delete ActionDispatch::Flash #Cookieベースのセッションストアを削除
    # config.middleware.delete ActionDispatch::Cookies #重複しているため再度削除
  end
end
