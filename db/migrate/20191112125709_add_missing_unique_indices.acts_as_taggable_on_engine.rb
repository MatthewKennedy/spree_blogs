class AddMissingUniqueIndices < ActiveRecord::Migration[6.0]
  def self.up
    add_index ActsAsTaggableOn.tags_table, :name, unique: true
    add_index ActsAsTaggableOn.taggings_table,
              [:tag_id, :taggable_id, :taggable_type, :context, :tagger_id, :tagger_type],
              unique: true, name: 'taggings_idx'
  end

  def self.down
    remove_index ActsAsTaggableOn.tags_table, :name
    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_idx'
  end
end
