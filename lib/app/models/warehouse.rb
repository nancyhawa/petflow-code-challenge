require 'json'

class Warehouse
  attr_accessor :name, :zip

  def self.create_by_zip_from_api(zipcode)
    warehouses = JSON.parse(File.read('lib/app/assets/warehouses_api.rb'))
    warehouses.each do | warehouse |
      return Warehouse.new(warehouse['name'], warehouse['zip']) if warehouse['zip'] == zipcode
    end
  end

  def initialize(name, zip)
    @name = name
    @zip = zip
  end

  def display
    puts "Warehouse Name: #{@name}"
    puts "Warehouse Zip code: #{@zip}"
  end

end
