class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :region, null: false, foreign_key: true
    end
  end
end
