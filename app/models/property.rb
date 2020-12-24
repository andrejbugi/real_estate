class Property < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 20, maximum: 256 }
  validates :category, presence: true
  validates :bedroom, presence: true, numericality: { only_integer: true }
  validates :bathroom, presence: true, numericality: { only_integer: true }
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :listing_type, presence: true
  validates :interior, presence: true

  has_many_attached :images

  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
