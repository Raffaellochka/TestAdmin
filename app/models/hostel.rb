class Hostel < ApplicationRecord
  belongs_to :city
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :region_name, presence: true
  validates :city_name, presence: true
end
