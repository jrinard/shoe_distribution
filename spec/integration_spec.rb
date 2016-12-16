require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Main Route', {:type => :feature}) do
  describe('Create Brand') do
    it "allows user to create a brand" do
      visit('/')
      fill_in('brand', :with => "Crocs")
      click_button('Create Brand')
      visit('/brands')
      expect(page).to have_content 'Crocs'
  end
    # it "allows the user to create a store" do
    #   visit('/')
    #   Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
    #   Brand.create({:name => "Crocs"})
    #   fill_in('store-name', :with => "Foot Locker")
    #   fill_in('new-address', :with => "1 Infinite Loop")
    #   fill_in('new-rating', :with => "5")
    #   fill_in('brand', :with => "Crocs")
    #   click_button('Create Store')
    #   visit('/stores')
    #   expect(page).to have_content 'Store List'
    # end
  end

  describe('show a store') do
    it "allows user to view individual store" do
      Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      visit("/stores")
      expect(page).to have_content 'The Crocs Store'
    end
  end

  describe('show a individual store') do
    it "allows user to view individual store" do
      store = Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
      visit("/store/#{store.id}")
      expect(page).to have_content 'The Crocs Store'
    end
  end

  describe('Modify a store', {:type => :feature}) do
    # it "allows user to update a store" do
    #   test_store = Store.create({:name => 'The Crocs Store', :address => '1 Infinite Loop', :ratings => 4})
    #   Brand.create({:name => "Crocs"})
    #   visit("/store/#{test_store.id}")
    #   fill_in('new-name', :with => "Foot Locker")
    #   fill_in('new-address', :with => "1 Infinite Loop")
    #   fill_in('new-rating', :with => "5")
    #   fill_in('brand_id', :with => "Crocs")
    #   click_button("Update")
    #   expect(page).to have_content 'Foot Locker'
    # end
    it "allows user to delete a store" do
      test_store = Store.create({:name => "Foot Locker"})
      visit("/store/#{test_store.id}")
      click_button("Delete Store")
      expect(page).not_to have_content 'Foot Locker'
    end
  end





end
