require('spec_helper')

describe Store do
  it "will check if the tables are setup right" do
    new_store = Store.create({:name => 'Foot Locker', :address => '1 Infinite Loop', :cost => '$20', :ratings => 4})
    expect(Store.all).to eq [new_store]
  end

  it "will check if to see if the store has a brand" do
    new_store = Store.create({:name => 'Foot Locker', :address => '1 Infinite Loop', :cost => '$20', :ratings => 4})
    new_brand = Brand.create({:name => 'nike'})
    new_brand2 = Brand.create({:name => 'sketchers'})
    new_brand3 = Brand.create({:name => 'crocs'})
    expect(new_store.brands.push(new_brand, new_brand2, new_brand3)).to(eq(new_store.brands))
    expect(Brand.all).to eq [new_brand, new_brand2, new_brand3]
  end

  it "will show the rating exists and grab a specific store rating" do
    new_store = Store.create({:name => 'Foot Locker', :address => '1 Infinite Loop', :cost => '$20', :ratings => 4.1})
    new_store2 = Store.create({:name => 'Shoe Emporium', :address => '1 Infinite Loop', :cost => '$20', :ratings => 8.3})
    new_store3 = Store.create({:name => 'Famous Footwear', :address => '1 Infinite Loop', :cost => '$20', :ratings => 9.9})
    new_store4 = Store.create({:name => 'Payless', :address => '1 Infinite Loop', :cost => '$20', :ratings => 1.5})
    expect(Store.all).to eq [new_store, new_store2, new_store3, new_store4]
    expect(new_store3.ratings).to eq 9.9
  end

# add validation specs


end
