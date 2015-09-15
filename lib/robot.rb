class Robot

  attr_accessor :bearing, :x_coord, :y_coord

  def initialize(bearing, x_coord, y_coord)
    @bearing = bearing
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def left
    @bearing = case bearing
               when "NORTH" then "WEST"
               when "EAST"  then "NORTH"
               when "SOUTH" then "EAST"
               when "WEST"  then "SOUTH"
               end
  end

  def right
    @bearing = case bearing
               when "NORTH" then "EAST"
               when "EAST"  then "SOUTH"
               when "SOUTH" then "WEST"
               when "WEST"  then "NORTH"
               end
  end

  def report
    return bearing, x_coord, y_coord
  end

end