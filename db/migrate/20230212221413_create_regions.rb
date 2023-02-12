class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.belongs_to :country, null: false, foreign_key: true
    end
  end
end
