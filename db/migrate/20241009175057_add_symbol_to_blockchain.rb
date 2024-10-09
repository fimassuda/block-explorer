class AddSymbolToBlockchain < ActiveRecord::Migration[7.2]
  def change
    add_column :blockchains, :symbol, :string
  end
end
