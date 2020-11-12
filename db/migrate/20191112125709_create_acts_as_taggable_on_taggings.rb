class CreateActsAsTaggableOnTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: { to_table: ActsAsTaggableOn.tags_table }
      t.references :taggable, polymorphic: true
      t.references :tagger, polymorphic: true
      t.string :context, limit: 128

      t.timestamps
    end
  end
end
