class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :region_name
      t.string :city_name
      t.belongs_to :city, null: false, foreign_key: true
    end
  end
end
