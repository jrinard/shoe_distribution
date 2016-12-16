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




end
