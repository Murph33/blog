class CreatePostFiles < ActiveRecord::Migration
  def change
    create_table :post_files do |t|
      t.string :name
      t.text :description
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
