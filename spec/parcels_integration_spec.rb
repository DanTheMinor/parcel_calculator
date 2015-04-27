require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require 'pry'

describe('The parsels path', {:type => :feature}) do
  it('take input through forms, send them through the cost_to_ship method, return the cost of shipping to the user.') do
    visit('/')
    fill_in('length', :with => 5)
    fill_in('width', :with => 5)
    fill_in('height', :with => 5)
    fill_in('weight', :with => 20)
    fill_in('distance', :with => 500)
    find_field('ship_speed').find('option[1]').select_option #Finds an id for a select html block. Then finds the option counting from the top down (starting at 1). Select_option selects that option.
    find_field('gift_wrap').find('option[2]').select_option
    click_button('calculate_cost')
    expect(page).to have_content('$12.00')
  end
end
