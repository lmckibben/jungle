require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Adding a product should update the number in cart" do
    # ACT
    visit products_path
    first('article.product').find_button('Add').click
    
    
    # DEBUG / VERIFY
    sleep 1
    # save_screenshot

    #puts page.html
    expect(page).to have_content("My Cart (1)")
  end
end
