class Action < ApplicationRecord
  belongs_to :block_transaction, class_name: "Transaction", foreign_key: "transaction_id"

  TRANSFER = "Transfer"
  FUNCTION_CALL = "FunctionCall"
  ACTION_TYPES = [TRANSFER, FUNCTION_CALL]

  validates :action_type, presence: true

  # Deposit value at the factor 10^24
  def deposit_value
    value = deposit.to_f / 10**24
    "#{value} #{block_transaction.blockchain.symbol}"
  end
end
