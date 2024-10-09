class Transaction < ApplicationRecord
  belongs_to :blockchain
  has_many :actions, dependent: :destroy

  validates :external_id, uniqueness: { scope: :blockchain_id }
  validates :time, :height, :transaction_hash, :block_hash, :sender, :receiver, :gas_burnt, presence: true
end
