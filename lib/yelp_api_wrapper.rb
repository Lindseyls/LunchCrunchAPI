require 'httparty'

class YelpApiWrapper
  class YelpError < StandardError; end

  BASE_URL = "https://api.yelp.com/v3/businesses/search"
  CLIENT_ID = ENV["CLIENT_IDD"]
  API_KEY = ENV["API_KEY"]
  LOCATION = "Seattle"
  TERM = "Restaurants"
  LIMIT = 50
  OPEN_NOW = "true"

  def self.list_restaurants

    full_url = URI.encode(BASE_URL + "?location=#{LOCATION}" + "&term=#{TERM}" + "&limit=#{LIMIT}" + "&open_now=#{OPEN_NOW}")

    response = HTTParty.get(full_url, headers: {"Authorization" => "Bearer #{API_KEY}"})

    raise YelpError.new("Could not find restaurants") unless response["businesses"]

    return response["businesses"].map do |raw_list|
      YelpApiAdapter.from_api(raw_list)
    end

  end


  # def self.show_recipe(uri)
  #
  #   uri_url = "http://www.edamam.com/ontologies/edamam.owl#recipe_"
  #   full_url = URI.encode(BASE_URL + "?r=#{uri_url}#{uri}&app_id=" + APP_ID + "&app_key=" + APP_KEY + "&from=#{FROM}&to=#{TO}")
  #
  #   response = HTTParty.get(full_url).parsed_response
  #
  #
  #   raise YelpError.new("Could not find the recipe") unless response[0]
  #
  #   return Yelp.from_api(response[0])
  # end

end
