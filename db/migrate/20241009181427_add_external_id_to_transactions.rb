class AddExternalIdToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :external_id, :string
  end
end
