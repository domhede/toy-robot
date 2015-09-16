class Table
  
  attr_reader :max_x, :max_y

  def initialize(x, y)
    @max_x = x
    @max_y = y
  end

  def coords_are_on_table?(x_dest, y_dest)
    (x_dest >= 0 && x_dest <= @max_x && y_dest >= 0 && y_dest <= @max_y)
  end

end
