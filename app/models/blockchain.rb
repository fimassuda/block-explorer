class Blockchain < ApplicationRecord
  has_many :transactions, dependent: :destroy
end
