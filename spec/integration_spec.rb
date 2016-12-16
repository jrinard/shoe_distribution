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
    it "allows the user to create a store" do
      visit('/')
      fill_in('new-name', :with => "Foot Locker")
      fill_in('new-address', :with => "1 Infinite Loop")
      fill_in('new-cost', :with => "$20")
      fill_in('new-rating', :with => "5")
      fill_in('brand', :with => "Crocs")
      click_button('Create Store')
      visit('/stores')
      expect(page).to have_content 'Store List'
    end
  end

end
