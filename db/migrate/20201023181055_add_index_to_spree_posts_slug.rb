class AddIndexToSpreePostsSlug < ActiveRecord::Migration[6.0]
  def change
    add_index :spree_posts, :slug, unique: true
  end
end
