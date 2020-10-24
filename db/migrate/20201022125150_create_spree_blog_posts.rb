class CreateSpreeBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_blog_posts do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :meta_title, :string
      t.column :meta_description, :text
      t.column :slug, :string
      t.column :summary, :text
      t.column :published_at, :datetime
      t.column :visible, :boolean, default: false

      t.belongs_to :spree_blog
      t.timestamps
    end
  end
end
