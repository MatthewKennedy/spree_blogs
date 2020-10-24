class ChangeSpreeBlogPostsToSpreePosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :spree_blog_posts, :spree_posts
  end
end
