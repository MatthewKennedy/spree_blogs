class ActsAsTaggableOnMigration < ActiveRecord::Migration[6.0]
  def self.up
    create_table ActsAsTaggableOn.tags_table do |t|
      t.string :name
      t.timestamps
    end

    create_table ActsAsTaggableOn.taggings_table do |t|
      t.references :tag, foreign_key: { to_table: ActsAsTaggableOn.tags_table }
      t.references :taggable, polymorphic: true
      t.references :tagger, polymorphic: true
      t.string :context, limit: 128

      t.datetime :created_at
    end

    add_index ActsAsTaggableOn.taggings_table, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx'
  end

  def self.down
    drop_table ActsAsTaggableOn.taggings_table
    drop_table ActsAsTaggableOn.tags_table
  end
end
