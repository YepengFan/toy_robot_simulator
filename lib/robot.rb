class Robot

  def initialize(table)
    @place = false
    @table = table
    @directions = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  end

  def place(x, y, direction)
    check_position(x,y)

    @x = x
    @y = y
    @place = true
    @facing = direction
  end

  def move

  end

  def left

  end

  def right

  end

  def report

  end

  private
  def check_position(x, y)

  end

  def position

  end

end