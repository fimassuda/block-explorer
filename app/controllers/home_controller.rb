class HomeController < ApplicationController
  def index
    @transfers = Action.includes(:block_transaction).where(action_type: Action::TRANSFER).order(created_at: :desc)
    @average_gas_burnt = Transaction.average(:gas_burnt)
  end
end
