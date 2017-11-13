require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should be valid with all the fields' do
      @category = Category.new(
        name: "Fabric"
      )
      @product = @category.products.new(
        name: "String",
        quantity: 10,
        price: 60
      )
      expect(@product).to be_valid
    end
    it 'should not be valid without a name' do
      @category = Category.new(
        name: "Fabric"
      )
      @product = @category.products.new(
        quantity: 10,
        price: 60
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should not be valid without a price' do
      @category = Category.new(
        name: "Fabric"
      )
      @product = @category.products.new(
        name: "String",
        quantity: 10
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should not be valid without a quantity' do
      @category = Category.new(
        name: "Fabric"
      )
      @product = @category.products.new(
        name: "String",
        price: 60
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should not be valid without a category' do
      @product = Product.new(
        name: "String",
        quantity: 10,
        price: 60
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
