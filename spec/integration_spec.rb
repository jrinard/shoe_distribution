require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before() do
  test_store = Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
  test_brand = Brand.create({:name => "Crocs"})
end

describe('Main Route', {:type => :feature}) do
  describe('Create Brand and View it') do
    it "allows user to create a brand" do
      visit('/')
      fill_in('brand', :with => "Crocs")
      click_button('Create Brand')
      visit('/brands')
      expect(page).to have_content 'Crocs'
    end
  end
  describe('Create a Store') do
    it "allows user to create and view individual store" do
      Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      visit("/stores")
      expect(page).to have_content 'The Crocs Store'
    end
    it "allows the user to create a store" do
      visit('/')
      Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      Brand.create({:name => "Crocs"})
      fill_in('store-name', :with => "Foot Locker")
      fill_in('new-address', :with => "1 Infinite Loop")
      fill_in('new-rating', :with => "5")
      fill_in('brand', :with => "Crocs")
      click_button('Create Store')
      visit('/stores')
      expect(page).to have_content 'Store List'
    end
  end
  describe('Show an Individual Store') do
    it "allows user to view individual store" do
      store = Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      visit("/store/#{store.id}")
      expect(page).to have_content 'The Crocs Store'
    end
  end
  describe('Update a Brand', {:type => :feature}) do
    it "allows user to update a brand" do
      test_brand = Brand.create({:name => "Crocs"})
      visit("/brands/#{test_brand.id}")
      fill_in('new_brand', :with => "Crocs2")
      click_button("Save")
      expect(page).to have_content 'Crocs2'
    end
    it "allows user to delete a brand" do
      test_brand = Brand.create({:name => "Keen"})
      visit("/brands/#{test_brand.id}")
      click_button("Delete")
      expect(page).not_to have_content 'Keen'
    end
  end
  describe('Update a Store', {:type => :feature}) do
    it "allows user to update a store" do
      test_store = Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      Brand.create({:name => "Crocs"})
      visit("/store/#{test_store.id}")
      click_button("Update")
      expect(page).to have_content 'The Crocs Store'
    end
    it "allows user to delete a Store" do
      test_store = Store.create({:name => 'Nike', :address => '1 Infinite Loop', :ratings => 4})
      visit("/store/#{test_store.id}")
      click_button("Delete Store")
      expect(page).not_to have_content 'Nike'
    end
  end
end
