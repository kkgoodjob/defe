class CreateUsersOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :users_orders do |t|
      t.references :user
      t.references :order
      t.timestamps
    end
  end
end
