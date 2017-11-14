require 'rails_helper'

RSpec.feature "User navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

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
    @first = first('article.product')
    @link = @first.find_link('Details')
    @link.click
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_css '.product-detail'
    puts page.html

  end

end
