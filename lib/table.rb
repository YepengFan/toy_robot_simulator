class Table

  def initialize(max_x, max_y)
    @min_x = 0
    @min_y = 0
    @max_x = max_x
    @max_y = max_y
  end

  def valid_position?(x, y)
    x.between?(@min_x,@max_x) and y.between?(@min_y, @max_y)
  end
end