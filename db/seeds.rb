# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Tag.destroy_all
Article.destroy_all
ArticleTag.destroy_all

user1 = User.create!(
    username: "user1",
    email: "user1@example.com",
    password: "password123",  # ここでパスワードを設定
    bio: "User 1 bio",
    image: "/uploads/cat.png",  # 相対パスを指定
    following: false
)

user2 = User.create!(
    username: "user2",
    email: "user2@example.com",
    password: "password123",  # ここでパスワードを設定
    bio: "User 2 bio",
    image: "/uploads/cat.png",  # 相対パスを指定
    following: false
)


tag1 = Tag.create!(name: "Ruby")
tag2 = Tag.create!(name: "Rails")
tag3 = Tag.create!(name: "javascript")

article1 = Article.create!(
    slug: "first-article",
    title: "First Article",  # 修正: tite -> title
    description: "this is the first article",
    body: "lorem ipsum dolor sit amet, consenctetur adi",
    createdAt: Time.now,
  updatedAt: Time.now,
  favorited: false,
  favoritesCount: 0,
  user_id: user1.id,
  created_at: Time.now,
  updated_at: Time.now
)


article2 = Article.create!(
  slug: "second-article",
  title: "Second Article",  # 修正: tite -> title
  description: "This is the second article",
  body: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  createdAt: Time.now,
  updatedAt: Time.now,
  favorited: false,
  favoritesCount: 0,
  user_id: user2.id,
  created_at: Time.now,
  updated_at: Time.now
)


ArticleTag.create!(article_id: article1.id, tag_id:tag1.id)
ArticleTag.create!(article_id: article1.id, tag_id: tag2.id)
ArticleTag.create!(article_id: article2.id, tag_id: tag2.id)
ArticleTag.create!(article_id: article2.id, tag_id: tag3.id)