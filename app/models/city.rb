class City < ApplicationRecord
  belongs_to :region
  has_many :hostels, dependent: :destroy

  validates :name, presence: true
end
