class CreateActions < ActiveRecord::Migration[7.2]
  def change
    create_table :actions do |t|
      t.string :action_type
      t.integer :gas
      t.string :deposit
      t.string :method_name
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
