class Shipment
  attr_accessor :zip

  def initialize(zip)
    @zip = zip
  end

  def fastest_warehouse
    raise Exception.new("That shipping zipcode is not in our database.")
  end
end

Shipment.new(00000).fastest_warehouse
