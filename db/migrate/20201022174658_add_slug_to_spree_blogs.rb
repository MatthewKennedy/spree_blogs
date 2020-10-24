class AddSlugToSpreeBlogs < ActiveRecord::Migration[6.0]
  def change
    add_index :spree_blogs, :slug, unique: true
  end
end
