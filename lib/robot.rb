class Robot
  def initialize(table)
    @place = false
    @table = table
    @directions = [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def place(x, y, direction)
    valid_direction? direction
    valid_position? x,y

    @place = true
    @directions.rotate! until @directions.first == direction
    @facing = @directions.first
    @position = [x, y]
  end

  def move
    case @facing
      when :NORTH then @position[1] += 1 if valid_position?(@position[0], @position[1] + 1)
      when :SOUTH then @position[1] -= 1 if valid_position?(@position[0], @position[1] - 1)
      when :EAST then @position[0] += 1 if valid_position?(@position[0] + 1, @position[1])
      when :WEST then @position[0] -= 1 if valid_position?(@position[0] - 1, @position[1])
    end
  end

  def left
    @directions.rotate! -1
    @facing = @directions.first
  end

  def right
    @directions.rotate! 1
    @facing = @directions.first
  end

  def report

  end

  private
  def valid_direction?(direction)
    raise "Direction should only be NORTH, EAST, SOUTH or WEST" unless @directions.include? direction
    @directions.include? direction
  end

  def valid_position?(x, y)
    raise "Position is not on the table" unless @table.valid_position?(x, y)
    @table.valid_position?(x, y)
  end
end
