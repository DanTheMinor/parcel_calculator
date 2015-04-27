require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The parsels path') do
  it('take input through forms, send them through the cost_to_ship method, return the cost of shipping to the user.') do
    visit('/')
    fill_in('length', :with => 5)
    fill_in('width', :with => 5)
    fill_in('height', :with => 5)
    fill_in('weight', :with => 20)
    fill_in('distance', :with => 500)
    #select ship_speed from dropdown
    click_button('calculate_cost')
    expect(page).to have_content('$12.00')
  end
end
