require('spec_helper')

describe Store do
  it "will check if the tables are setup right" do
    new_store = Store.create({:name => 'Foot Locker', :address => '1 Infinite Loop', :cost => '$20', :ratings => 4})
    expect(Store.all).to eq [new_store]
  end

end
