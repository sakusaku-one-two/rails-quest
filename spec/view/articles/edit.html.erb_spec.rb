require 'rails_helper'#Rspecの設定ファイルを読み込む

RSpec.describe "articles/edit", type: :view do #articles/editビューのテストを定義
    before do# 各テストの前に実行されるコード
        user = User.create!(email:"test@example.com",password:"testPassword")#テスト用のユーザー
        @article = assign(:article, Article.create!(#テスト用の記事を作成し、ビューに渡す
        title: "Sample Title",#記事のタイトル
        description: "Sample Description",
        user:user,
        body: "Sample Body",
        tags: [Tag.create!(name: "SampleTag")]
        ))
    end


    it "renders the edit article form" do #記事編集フォームが正しく表示されるかをテスト
        render#ビューをレンダリング

        assert_select "form[action=?][method=?]", article_path(@article.id), "post" do#フォームのアクションとメソッドを確認
            assert_select "input[name=?]", "article[title]"#タイトル入力フィールドが存在するか確認
            assert_select "input[name=?]", "article[description]"#説明入力フィールドがぞんざいするか確認
            assert_select "textarea[name=?]", "article[body]"#本文入力フィールドが存在するか確認
            assert_select "input[name=?]", "article[tags]"#タグ入力フィールドが存在するかを確認
        end
    end


    it "displays the existing tags" do#既存のタグが表示されるかをテスト
        render#ビューをレンダリング
        expect(rendered).to match /SampleTag/#レンダリングされたビューに”SampleTag”が含まれているか確認
    end

    it "has a delete button for the article" do#記事の削除ボタンが存在するかをテスト
        render#ビューをレンダリング
        assert_select "form[action=?][method=?]", article_path(@article.id), "post" do#フォームのアクションとメソッドを確認
            assert_select "input[type=?][value=?]", "submit", "Update Article"#更新ボタンが存在するかの確認
        end
        assert_select "button[type=?]", "submit", text: "Delete Article"#削除ボタンが存在するか確認
    end
end