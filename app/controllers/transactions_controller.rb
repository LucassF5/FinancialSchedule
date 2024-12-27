class TransactionsController < ApplicationController
  before_action :set_transaction, only: [ :edit, :update, :show, :destroy]
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to root_path, notice: "Transaction was successfully created."
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
      redirect_to root_path, notice: "Transaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @transaction.destroy!
      redirect_to root_path, notice: "Transaction was successfully deleted."
    else
      redirect_to root_path, alert: "Transaction could not be deleted."
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