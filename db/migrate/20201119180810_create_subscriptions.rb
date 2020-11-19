class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :tier
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
