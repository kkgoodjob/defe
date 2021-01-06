class CreateUsersNegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_negotiations do |t|
      t.references :negotiation, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
