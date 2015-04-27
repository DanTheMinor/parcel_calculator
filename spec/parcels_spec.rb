require('rspec')
require('parcels')

describe(Parcels) do
  describe('Parcels#get_volume') do
    it('Will return the volume of the parcel') do
      test_par = Parcels.new(5, 5, 5, 20)
      expect(test_par.get_volume()).to(eq(125))
    end
  end
  describe('Parcels#cost_to_ship') do
    it('Will return the cost to ship a parcel') do
      test_par = Parcels.new(5, 5, 5, 20)
      expect(test_par.cost_to_ship(500, 'ground')).to(eq(12.00))
    end
  end
  describe('Parcels#cost_to_wrap') do
    it("Will calculate the cost to wrap a parcel, based on the parcel's surface area") do
      test_par = Parcels.new(5, 5, 5, 20)
      expect(test_par.cost_to_wrap()).to(eq(0.75))
    end
  end
end
