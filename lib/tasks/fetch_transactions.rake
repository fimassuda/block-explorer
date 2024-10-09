require 'net/http'

# Fetch all transactions for NEAR blockchain
# and store transactions
namespace :fetch_transactions do
  desc "Fetch all transactions for NEAR blockchain"
  task near: :environment do
    blockchain = Blockchain.find_by!(name: "NEAR")

    uri = URI(blockchain.endpoint)
    params = { api_key: ENV['NEAR_API_KEY'] }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)

    transactions_payload = JSON.parse(response.body)

    transactions_payload.each do |transaction_payload|
      saved_transaction = Transaction.find_or_create_by!(
        time: transaction_payload["time"],
        height: transaction_payload["height"],
        transaction_hash: transaction_payload["hash"],
        block_hash: transaction_payload["block_hash"],
        sender: transaction_payload["sender"],
        receiver: transaction_payload["receiver"],
        gas_burnt: transaction_payload["gas_burnt"],
        blockchain_id: blockchain.id,
        external_id: transaction_payload["id"]
      )
      transaction_payload["actions"].each do |action|
        Action.find_or_create_by!(
          action_type: action["type"],
          gas: action["data"]["gas"],
          deposit: action["data"]["deposit"],
          method_name: action["data"]["method_name"],
          transaction_id: saved_transaction.id
        )
      end
      puts "Saved #{saved_transaction.id} for fetched external_transaction_id: #{transaction_payload["id"]}"
    end
  end
end
