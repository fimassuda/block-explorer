class AddBlockchainRelationToTransaction < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :blockchain_id, :bigint
  end
end
