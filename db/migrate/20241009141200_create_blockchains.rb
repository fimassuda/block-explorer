class CreateBlockchains < ActiveRecord::Migration[7.2]
  def change
    create_table :blockchains do |t|
      t.string :name
      t.string :endpoint

      t.timestamps
    end
  end
end
