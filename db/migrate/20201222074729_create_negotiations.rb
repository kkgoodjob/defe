class CreateNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :negotiations do |t|
      t.references :item, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :attributing_id
      t.boolean :checked
      t.timestamps
    end
  end
end
