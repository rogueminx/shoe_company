require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store creation path', {:type => :feature} do
  it 'takes the user to the store page where they can create a store' do
    visit '/stores'
    fill_in('store_name', :with => 'Fake Store')
    click_button('Add Store')
    expect(page).to have_content('Fake Store')
  end
end

describe 'the brand creation path', {:type => :feature} do
  it 'takes the user to the brand page where they can create a brand' do
    visit '/brands'
    fill_in('brand_name', :with => 'High heels')
    fill_in('price', :with => '50.00')
    click_button('Add Brand')
    expect(page).to have_content('High heels')
  end
end

describe 'the store update path', {:type => :feature} do
  it 'allows a user to change the name of the store' do
    test_store = Store.create({:store_name => 'Fake Store', :id => nil})
    id = test_store.id
    visit "/store/#{id}"
    fill_in('store_name', :with => 'Real Store')
    click_button('Update Name')
    expect(page).to have_content('Real Store')
  end
end

describe 'the store delete path', {:type => :feature} do
  it 'allows a user to delete a store' do
    test_store = Store.create({:store_name => 'Another Store', :id => nil})
    id = test_store.id
    visit "/store/#{id}"
    click_button('Delete this Store')
    visit '/stores'
    expect(page).not_to have_content('Another Store')
  end
end

describe 'add brand to store path', {:type => :feature} do
  it 'allows a user to add a brand to a store' do
    test_store = Store.create({:store_name => 'Yet Another Store', :id => nil})
    test_brand = Brand.create({:brand_name => 'Wedges', :price => 50.00, :id => nil})
    test_brand = Brand.create({:brand_name => 'High Heels', :price => 50.00, :id => nil})
    id = test_store.id
    brand_id = test_brand.id
    visit "/store/#{id}"
    select('Wedges', from: 'brand_id')
    click_button('Add brand')
    expect(page).to have_content('Wedges')
  end
end
