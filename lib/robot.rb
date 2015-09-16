class Robot

  attr_accessor :bearing, :x_coord, :y_coord, :table

  def place(bearing, x, y, table)

    @table = table

    if @table.coords_are_on_table?(x,y)
      @y_coord = y
      @x_coord = x
    end

    @bearing = bearing

    return nil
  end

  def left
    @bearing = case bearing
               when "NORTH" then "WEST"
               when "EAST"  then "NORTH"
               when "SOUTH" then "EAST"
               when "WEST"  then "SOUTH"
               end
    return nil
  end

  def right
    @bearing = case bearing
               when "NORTH" then "EAST"
               when "EAST"  then "SOUTH"
               when "SOUTH" then "WEST"
               when "WEST"  then "NORTH"
               end
    return nil
  end

  def report
    return "#{x_coord},#{y_coord},#{bearing}"
  end

  def move
    message = nil

    y_dest = @y_coord
    x_dest = @x_coord

    case bearing
    when "NORTH"
      y_dest = @y_coord + 1
    when "EAST"
      x_dest = @x_coord + 1
    when "SOUTH"
      y_dest = @y_coord - 1
    when "WEST"
      x_dest = @x_coord - 1
    end

    if @table.coords_are_on_table?(x_dest, y_dest)
      @y_coord = y_dest
      @x_coord = x_dest
    else
      message = "That move will send the robot of the table.  This is not allowed."
    end

    return message    

  end

end