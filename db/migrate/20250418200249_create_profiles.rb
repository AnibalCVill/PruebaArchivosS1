class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phone
      t.text :description
      t.string :profile_picture
      t.string :email

      t.timestamps
    end
  end
end
