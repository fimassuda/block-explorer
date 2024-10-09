class Transaction < ApplicationRecord
  belongs_to :blockchain
  has_many :actions, dependent: :destroy
end
