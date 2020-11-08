class CreateBlogsStores < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_blogs_stores, id: false do |t|
      t.belongs_to :store
      t.belongs_to :blog
    end
  end
end
