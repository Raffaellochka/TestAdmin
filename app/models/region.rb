class Region < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  validates :name, presence: true
end
