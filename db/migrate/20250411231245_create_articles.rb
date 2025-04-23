class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :info_type
      t.string :references

      t.timestamps
    end
  end
end
