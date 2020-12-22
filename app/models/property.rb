class Property < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :listing_type, presence: true
  validates :interior, presence: true
end
