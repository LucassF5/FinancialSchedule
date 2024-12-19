require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = FactoryBot.build(:user)
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is invalid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is invalid with an invalid email" do
      @user.email = "testemail.com"
      expect(@user).to_not be_valid
    end

    it "is invalid without a username" do
        @user.username = nil
        expect(@user).to_not be_valid
    end

    it "is invalid with a short username" do
        @user.username = "a"
        expect(@user).to_not be_valid
    end

    it "is invalid with a long username" do
      @user.username = "a" * 101
      expect(@user).to_not be_valid
    end

    it "is invalid with a numeric username" do
      @user.username = "123456"
      expect(@user).to_not be_valid
    end

    it "is invalid without a password" do
        @user.password = nil
        expect(@user).to_not be_valid
    end

    it "is invalid with a short password" do
      @user.password = "Pa1@"
      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("Password deve ter no mínimo 9 caracteres")
    end

    it "is invalid with a password without a number" do
      @user.password = "Password@"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password deve incluir um número")
    end

    it "is invalid with a password without a special character" do
      @user.password = "Password123"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password deve incluir um caractere especial")
    end

    it "is invalid with a password without a uppercase letter" do
      @user.password = "password123@"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password deve incluir uma letra maiúscula")
    end

    it "is invalid with a password without a lowercase letter" do
      @user.password = "PASSWORD123!"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password deve incluir uma letra minúscula")
    end
  end
end
