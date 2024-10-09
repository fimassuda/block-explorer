class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.bigint :gas_burnt
      t.datetime :time
      t.string :transaction_hash
      t.string :block_hash
      t.string :sender
      t.string :receiver
      t.bigint :height

      t.timestamps
    end
  end
end
