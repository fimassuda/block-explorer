class Blockchain < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :name, :symbol, presence: true
end
