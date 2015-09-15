class Table
  
  attr_reader :max_x, :max_y

  def initialize(x, y)
    @max_x = x
    @max_y = y
  end

  def coords_are_on_table?(x, y)
    (x >= 0 && x <= @max_x && y >= 0 && y <= @max_y)
  end

end
