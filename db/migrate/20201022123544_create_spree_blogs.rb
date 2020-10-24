class CreateSpreeBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_blogs do |t|
      t.column :title, :string
      t.column :meta_title, :string
      t.column :meta_description, :text
      t.column :slug, :string

      t.timestamps
    end
  end
end
