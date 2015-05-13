require 'robot'

describe Robot do
  let(:robot) do
    table = double
    allow(table).to receive(:valid_position?).with(4, 4).and_return(true)
    allow(table).to receive(:valid_position?).with(6, 6).and_return(false)
    Robot.new(table)
  end

  context 'when it is initialized' do
    it 'should not be placed' do
      expect(robot.instance_variable_get(:@place)).to eq(false)
    end

    it 'should have directions' do
      # expect(robot.instance_variable_get(:@directions)).to eq(['NORTH', 'EAST', 'SOUTH', 'WEST'])
      expect(robot.instance_variable_get(:@directions)).to eq([:NORTH, :EAST, :SOUTH, :WEST])
    end
  end

  context 'when it is placed' do
    it 'raise exception if direction is unreal' do
      expect { robot.place(4, 4, "UNREAL DIRECTION")}.to raise_error(RuntimeError, "Direction should only be NORTH, EAST, SOUTH or WEST")
    end

    it 'initilize variables if robot is on the table' do
      robot.place(4, 4, :NORTH)
      expect(robot.instance_variable_get(:@place)).to eq(true)
      expect(robot.instance_variable_get(:@facing)).to eq(:NORTH)
      expect(robot.instance_variable_get(:@position)).to eq([4, 4])
    end

    it 'raise exception if place robot is out of table' do
      expect { robot.place(6, 6, :NORTH) }.to raise_error(RuntimeError, "Position is not on the table")
      expect(robot.instance_variable_get(:@place)).to eq(false)
    end
  end
end