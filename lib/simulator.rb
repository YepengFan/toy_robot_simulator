require_relative 'table'
require_relative 'robot'

class Simulator
  def initialize
    @table = Table.new(4, 4)
    @robot = Robot.new(@table)
  end

  def execute(command)
    tokens = command.split(/[ ,]/)
    operation = tokens.first.upcase

    case operation
      when "PLACE" then
        valid_place_command_length?(tokens)
        valid_position_value?(tokens[1], tokens[2])
        x = tokens[1].to_i
        y = tokens[2].to_i
        facing = tokens[3].upcase.to_sym

        @robot.place(x, y, facing)
      when "MOVE" then
        @robot.move if robot_placed?
      when "LEFT" then
        @robot.left if robot_placed?
      when "RIGHT" then
        @robot.right if robot_placed?
      when "REPORT" then
        puts @robot.report if robot_placed?
    end
  end

  private
  def valid_position_value?(x, y)
    invalid = x =~ /^\d+$/ ? true : false or y =~ /^\d+$/ ? true : false
    raise "Invalid position value" unless invalid
    invalid
  end

  def valid_place_command_length?(tokens)
    raise "Invalid place command" unless tokens.size == 4
    tokens.size == 4
  end

  def robot_placed?
    @robot.placed
  end
end