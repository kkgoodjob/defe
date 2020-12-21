class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :s_name, null: false
      t.string :s_branch, null: false
      t.integer :prefecture_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
