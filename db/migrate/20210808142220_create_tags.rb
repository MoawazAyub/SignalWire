class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag_title
      t.integer :tag_count

      t.timestamps
    end
  end
end
