require('sinatra')
require('sinatra/reloader')
require('./lib/parcels')
also_reload('lib/**/*.rb')
require 'pry'

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
  @gift_wrap = params.fetch('gift_wrap')
  test_parc = Parcels.new(@length, @width, @height, @weight)
  if @gift_wrap == "Yes"
    @cost = test_parc.cost_to_ship(@distance, @ship_speed).+test_parc.cost_to_wrap()
  else
    @cost = test_parc.cost_to_ship(@distance, @ship_speed)
  end
  @cost = sprintf "%.2f", @cost
  erb(:parcel)
end

get ('/index') do
  erb(:index)
end
