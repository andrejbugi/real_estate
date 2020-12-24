class Search < ApplicationRecord

  def search_properties
    properties = Property.all

    properties = properties.where(["title LIKE ?","%#{keywords}%"]) if keywords.present?
    properties = properties.where(["category LIKE ?", category]) if category.present?
    properties = properties.where(["location LIKE ?", location]) if location.present?
    properties = properties.where(["listing_type LIKE ?", listing_type]) if listing_type.present?
    properties = properties.where(["bedroom = ?", bedroom]) if bedroom.present?
    properties = properties.where(["bathroom = ?", bathroom]) if bathroom.present?
    properties = properties.where(["price >= ?", min_price]) if min_price.present?
    properties = properties.where(["price <= ?", max_price]) if max_price.present?

    return properties
  end
end
