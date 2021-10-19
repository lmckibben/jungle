require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "Click product to see description" do
    # ACT
    visit products_path
    first('h4').click
    
    
    # DEBUG / VERIFY
    sleep 5
    #save_screenshot

    #puts page.html

    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Price")
  end

end
