require('sinatra')
require('sinatra/reloader')
require('./lib/parcels')
also_reload('lib/**/*.rb')

get ('/') do
  erb(:index)
end

get ('/parcel') do
  @length = params.fetch('length').to_i()
  @width = params.fetch('width').to_i()
  @height = params.fetch('height').to_i()
  @weight = params.fetch('weight').to_i()
  @distance = params.fetch('distance').to_i()
  @ship_speed = params.fetch('ship_speed')
  test_parc = Parcels.new(@length, @width, @height, @weight)
  @cost = test_parc.cost_to_ship(@distance, @ship_speed)
  erb(:parcel)
end

get ('/index') do
  erb(:index)
end
