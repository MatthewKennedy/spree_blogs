class CreateSpreePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_posts do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :meta_title, :string
      t.column :meta_description, :text
      t.column :slug, :string, unique: true
      t.column :summary, :text
      t.column :published_at, :datetime
      t.column :visible, :boolean, default: false

      t.belongs_to :blog
      t.timestamps
    end
  end
end
