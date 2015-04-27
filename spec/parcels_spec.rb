require('rspec')
require('parcels')

describe(Parcels) do
  describe('Parcels#get_volume') do
    it('Will return the volume of the parcel') do
      test_par = Parcels.new(5, 5, 5, 20)
      expect(test_par.get_volume()).to(eq(125))
    end
  end
end
