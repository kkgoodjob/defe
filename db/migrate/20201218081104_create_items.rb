class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, nul:false
      t.string :item_s_name
      t.string :item_s_branch
      t.string :volume, nul:false
      t.text :comments, nul:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
