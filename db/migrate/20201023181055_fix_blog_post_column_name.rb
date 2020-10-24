class FixBlogPostColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :spree_blog_posts, :spree_blog_id, :blog_id
  end
end
