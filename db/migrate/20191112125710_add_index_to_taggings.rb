class AddIndexToTaggings < ActiveRecord::Migration[6.0]
  def change
    add_index :taggings, :taggable_id
    add_index :taggings, :taggable_type
    add_index :taggings, :tagger_id
    add_index :taggings, :context
  end
end
