require 'rest-client'
require 'json'
require 'pry'
require 'active_record'
require 'require_all'
require_all 'app/models'

class EventBriteAdapter
  attr_accessor :search_keyword, :zipcode, :radius, :price, :start_date, :venue_id
  TOKEN = "5CCFIIFLIPFQUNLDYOES"
  EVENT_ROUTE = "https://www.eventbriteapi.com/v3/events/search/?q="
  VENUE_ROUTE = "https://www.eventbriteapi.com/v3/events/"

  def initialize(search_keyword:, zipcode:, radius:, price:, start_date:)
    @search_keyword = search_keyword
    @zipcode = zipcode
    @radius = radius
    @price = price
    @start_date = start_date
  end

  # EVENT RELATED API METHODS
  def event_route
    "#{EVENT_ROUTE}#{@search_keyword}&sort_by=best&location.address=#{@zipcode}&location.within=#{@radius}mi&price=#{@price}&start_date.keyword=#{@start_date}&token=#{TOKEN}"
  end

  def get_events_hash
    response = RestClient.get(self.event_route)
    JSON.parse(response)["events"]
  end

  def create_event_objects
    parsed_data = self.get_events_hash
    parsed_data.collect do |event_hash|
      hash = {}
      hash[:name] = event_hash["name"]["text"]
      hash[:event_brite_id] = event_hash["id"]
      hash[:url] = event_hash["url"]
      hash[:description] = event_hash["description"]["text"]
      hash[:start_time] = event_hash["start"]["local"]
      hash[:end_time] = event_hash["end"]["local"]
      hash[:image_url] = event_hash["logo"]["url"]
      hash[:free] = event_hash["is_free"]

      @venue_id = event_hash["venue_id"]
      venue = self.find_or_create_venue_object
      venue.events << Event.create(hash)
    end
  end

  # VENUE RELATED API METHODS
  def venue_route
    "#{VENUE_ROUTE}#{@venue_id}&token=#{TOKEN}"
  end

  def get_venue_hash
    response = RestClient.get(self.venue_route)
    JSON.parse(response)
  end

  def find_or_create_venue_object
    venue_hash = self.get_venue_hash
    if Venue.find_by(venue_no: venue_hash["id"])
      Venue.find_by(venue_no: venue_hash["id"])
    else
      Venue.create(address: venue_hash["address"]["localized_address_display"], venue_no: venue_hash["id"])
    end
  end
end

# event_params = { search_keyword: "halloween", zipcode: 10016, radius: 4, price: "free", start_date: "this_week" }
# testing = EventBriteAdapter.new(event_params)
# testing.create_event_objects
