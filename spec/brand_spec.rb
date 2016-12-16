require('spec_helper')

describe Brand do
  it "will check if the tables are setup right" do
    new_brand = Brand.create(:name => 'Crocs')
    expect(Brand.all).to eq [new_brand]
  end
  it "will check to see the brands had a recipe" do
    new_store = Store.create({:name => 'Foot Locker', :address => '1 Infinite Loop', :cost => '$20', :ratings => 4})
    new_brand = Brand.create(:name => 'Crocs')
    new_brand2 = Brand.create(:name => 'Nike')
    new_brand3 = Brand.create(:name => 'Keen')
    expect(new_brand.stores.push(new_store)).to(eq(new_brand.stores))
    expect(Brand.all).to eq [new_brand, new_brand2, new_brand3]
  end

  #add validation later

end
