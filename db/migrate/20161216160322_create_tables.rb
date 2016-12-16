class CreateTables < ActiveRecord::Migration[5.0]
  def change

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:address, :string)
      t.column(:cost, :string)
      t.column(:ratings, :float)
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
    end

    create_table(:brands_stores) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
    end

  end
end
