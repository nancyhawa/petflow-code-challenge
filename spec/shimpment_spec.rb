require 'app/models/shipment'

describe 'Shipment' do
  describe '#fastest_warehouse' do
    context 'given a valid zip code'
      it 'returns the fastest warehouse' do
        expect(Shipment.new('23569').fastest_warehouse).to eql(10102)
      end
    end
    context 'given an ivalid zip code'
      it 'returns the fastest warehouse' do
        expect(Shipment.new(00000).fastest_warehouse).to eql(8)
      end
    end
  end
end
