class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text, null:false
      t.references :negotiation, foreign_key: true
      t.timestamps
    end
  end
end
