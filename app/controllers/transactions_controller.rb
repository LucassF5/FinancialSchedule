class TransactionsController < ApplicationController
  before_action :set_transaction, only: [ :edit, :update, :show, :destroy ]
  def index
    @transactions = current_user.transactions.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.create(transaction_params)

    if @transaction.persisted?
      redirect_to @transaction, notice: "Transaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: "Transaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @transaction.destroy!
      redirect_to transactions_path, notice: "Transaction was successfully deleted."
    else
      redirect_to transactions_path, alert: "Transaction could not be deleted."
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :transaction_type, :date)
  end
end
