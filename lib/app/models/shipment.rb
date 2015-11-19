require 'json'
require_relative 'warehouse'

class Shipment
  attr_accessor :zip

  def initialize(zip)
    @zip = zip
  end

  def fastest_warehouse
    @result = nil
    @fastest = Float::INFINITY
    parse_api
    return_result_or_raise_error
  end

  def parse_api
    data = JSON.parse(File.read('lib/app/assets/transit_times_api.rb'))
    data.each do |shipment|
      if shipment['destination'] == @zip && shipment['transit_time'] <= @fastest
        @fastest = shipment['transit_time']
        @result = Warehouse.create_by_zip_from_api(shipment['origin'])
      end
    end
  end

  def return_result_or_raise_error
    if @result
      @result
    else
      raise "The zipcode #{@zip} is not in our database."
    end
  end

end
