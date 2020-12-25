class CreateNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :negotiations do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :user_attribute, null: false
      t.timestamps
    end
  end
end
