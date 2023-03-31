require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'Test Category')
      @product = Product.new(
        name: 'Test Product',
        price: 10.99,
        quantity: 5,
        category: @category
      )
  end
  it 'saves successfully with all four fields set' do
    expect(@product).to be_valid
  end

  it 'is invalid without a name' do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it 'is invalid without a price' do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
  end

  it 'is invalid without a quantity' do
    @product.quantity = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Quantity can't be blank") 
  end
  it 'is invalid without a category' do
    @product.category = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Category can't be blank")
  end
end
end