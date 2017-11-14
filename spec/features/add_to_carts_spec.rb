require 'rails_helper'

RSpec.feature "User clicks to add to cart and cart will increase by one", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # click_on

  scenario "They click on product to see the product" do
    # ACT
    visit root_path
    # CLICK THE product
    # click_on 'product'
    @cart = first('article.product')
    @link = @cart.find_link('Add')
    @link.click
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
    puts page.html

  end

end
