require 'app/models/shipment'

describe 'Shipment' do
  describe '#fastest_warehouse' do
    context 'given a valid zip code' do
      it 'returns the fastest warehouse' do
        expect(Shipment.new('23569').fastest_warehouse.zip).to eql(10102)
      end
    end

    context 'given an invalid zip code' do
      it 'raises an error' do
        expect{(Shipment.new(99999).fastest_warehouse)}.to raise_error('The zipcode 99999 is not in our database.')
      end
    end
  end
end
