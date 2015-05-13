class Robot
  def initialize(table)
    @place = false
    @table = table
    @directions = [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def place(x, y, direction)
    raise "Direction should only be NORTH, EAST, SOUTH or WEST" unless @directions.include? direction
    raise "Position is not on the table" unless @table.valid_position?(x, y)

    @place = true
    @directions.rotate! until @directions.first == direction
    @facing = @directions.first
    @position = [x, y]
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
  def position

  end

  def turn(direction)

  end
end
