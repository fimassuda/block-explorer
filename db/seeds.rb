# Create NEAR blockchain\
# https://4816b0d3-d97d-47c4-a02c-298a5081c0f9.mock.pstmn.io/near/transactions?api_key=SECRET_API_KEY
blockchain = Blockchain.find_or_create_by!(
  name: "NEAR",
  endpoint: "https://4816b0d3-d97d-47c4-a02c-298a5081c0f9.mock.pstmn.io/near/transactions",
  symbol: "NEAR"
)
# create transaction and action ie:
# {
#         "id": 208851,
#         "created_at": "2021-01-11T10:20:13.70879-06:00",
#         "updated_at": "2021-01-11T10:20:13.70879-06:00",
#         "time": "2021-01-11T10:20:04.132926-06:00",
#         "height": 27326763,
#         "hash": "6RtU9UkAQaJBVMrgvtDiARxzbhx1vKrwoTv4aZRxxgt7",
#         "block_hash": "FrWmh1BtBc8yvAZPJrJ97nVth6eryukbLANyFQ3TuQai",
#         "sender": "86e6ebcc723106eee951c344825b91a80b46f42ff8b1f4bd366f2ac72fab99d1",
#         "receiver": "d73888a2619c7761735f23c798536145dfa87f9306b5f21275eb4b1a7ba971b9",
#         "gas_burnt": "424555062500",
#         "actions": [
#             {
#                 "data": {
#                     "deposit": "716669915088987500000000000"
#                 },
#                 "type": "Transfer"
#             }
#         ],
#         "actions_count": 1,
#         "success": true
#     }
transaction = Transaction.find_or_create_by!(
  time: '2021-01-11T10:20:04.132926-06:00',
  height: 27326763,
  transaction_hash: '6RtU9UkAQaJBVMrgvtDiARxzbhx1vKrwoTv4aZRxxgt7',
  block_hash: 'FrWmh1BtBc8yvAZPJrJ97nVth6eryukbLANyFQ3TuQai',
  sender: '86e6ebcc723106eee951c344825b91a80b46f42ff8b1f4bd366f2ac72fab99d1',
  receiver: 'd73888a2619c7761735f23c798536145dfa87f9306b5f21275eb4b1a7ba971b9',
  gas_burnt: 424555062500,
  blockchain_id: blockchain.id
)

Action.find_or_create_by!(
  action_type: Action::TRANSFER,
  gas: nil,
  deposit: '716669915088987500000000000',
  method_name: nil,
  transaction_id: transaction.id
)
