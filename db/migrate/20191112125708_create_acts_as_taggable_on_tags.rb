class CreateActsAsTaggableOnTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.integer :taggings_count, default: 0

      t.timestamps
    end
  end
end
