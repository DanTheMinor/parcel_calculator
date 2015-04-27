class Parcels
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  define_method(:get_volume) do
    return @length.*(@width).*(@height)
  end

  define_method(:cost_to_ship) do |distance, ship_speed|
    @cost_to_ship = 8
    @cost_mult = 1

    if @weight < 10
      @cost_mult += 0
    elsif @weight < 20
      @cost_mult += 0.1
    elsif @weight < 30
      @cost_mult += 0.2
    elsif @weight >= 30
      @cost_mult += 0.3
    end

    if distance < 100
      @cost_mult += 0
    elsif distance < 250
      @cost_mult += 0.1
    elsif distance < 500
      @cost_mult += 0.2
    elsif distance < 1000
      @cost_mult += 0.3
    elsif distance >= 1000
      @cost_mult += 0.4
    end

    if ship_speed == 'ground'
      @cost_mult += 0
    elsif ship_speed == 'air'
      @cost_mult += 0.1
    else #for overnight shipping
      @cost_mult += 0.2
    end

    @cost_to_ship = sprintf "%.2f", (@cost_to_ship.*(@cost_mult))
     return @cost_to_ship.to_f()
  end

  define_method(:cost_to_wrap) do
    @surf_area = 2.*(@length.*@width) + 2.*(@length.*@height) + 2.*(@height.*@width)
    @cost_to_wrap = sprintf "%.2f", (0.005.*@surf_area)
    return @cost_to_wrap.to_f()
  end

end
