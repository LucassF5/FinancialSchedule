require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:all) do
    @transaction = FactoryBot.build(:transaction)
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(@transaction).to be_valid
    end

    it "is not valid without an amount" do
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end

    # it "is not valid with a invalid transaction_type" do
    #   @transaction = build(@transaction, transaction_type: :nil)
    #   expect(@transaction).to_not be_valid
    # end

    # it "is not valid without a date" do
    #   @transaction.date = nil
    #   expect(@transaction).to_not be_valid
    # end
  end
end
