class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.string :editors
      t.string :info_type
      t.string :related_info
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
