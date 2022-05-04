class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type_transaction
      t.string :type_coin_send
      t.string :type_coin_get
      t.decimal :amont_to_send
      t.decimal :amont_to_get
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
