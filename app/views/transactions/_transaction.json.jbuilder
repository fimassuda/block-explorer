json.extract! transaction, :id, :gas_burnt, :time, :transaction_hash, :block_hash, :sender, :receiver, :height, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
