class YelpApiAdapter

  attr_reader :id, :name, :image_url, :url, :review_count, :rating, :price, :location, :latitude, :longitude, :distance, :display_phone

  def initialize(id, name, image_url, url, review_count, rating, price, location, latitude, longitude, distance, display_phone)

    if id.nil? || id.empty? || name.nil? || name.empty?
      raise ArgumentError.new("No information found")
    end

    @id = id
    @name = name
    @image_url = image_url
    @url = url
    @review_count = review_count
    @rating = rating
    @price = price
    @location = location
    @latitude = latitude
    @longitude = longitude
    @distance = distance
    @display_phone = display_phone
  end

  def self.from_api(raw_list)
    self.new(
      raw_list["id"],
      raw_list["name"],
      raw_list["image_url"],
      raw_list["url"],
      raw_list["review_count"],
      raw_list["rating"],
      raw_list["price"],
      raw_list["location"]["display_address"],
      raw_list["coordinates"]["latitude"],
      raw_list["coordinates"]["longitude"],
      raw_list["distance"],
      raw_list["display_phone"]
    )
  end
end
