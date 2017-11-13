require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid with all the fields' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to be_valid
    end
    it 'should not be valid without a name' do
      @user = User.new(
        email: "jane@doe.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'should not be valid without a email' do
      @user = User.new(
        name: "Jane",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should not be valid without a password' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'should not be valid without a password_confirmation' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "123456"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'should be valid if password_confirmation and password are same' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to be_valid
    end
    it 'should not be valid if password_confirmation and password are different' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "123456",
        password_confirmation: "1234567"
      )
      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'should not be valid if email is taken' do
      @user1 = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "123456",
        password_confirmation: "123456"
      )
      @user1.save!
      @user2 = User.new(
        name: "Doe",
        email: "JANE@doe.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user2).to_not be_valid
    end
    it 'should not be valid if password is less than 6 characters' do
      @user = User.new(
        name: "Jane",
        email: "jane@doe.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end
end

# It must be created with a password and password_confirmation fields
#     These need to match so you should have an example for where they are not the same
#     These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)


# t.string   "name"
# t.string   "email"
# t.string   "password_digest"
