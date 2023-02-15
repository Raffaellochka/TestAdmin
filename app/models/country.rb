class Country < ApplicationRecord
  has_many :regions, dependent: :destroy

  validates :name, presence: true
end
