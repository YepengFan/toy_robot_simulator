require 'robot'

describe Robot do
  let(:robot) do
    table = double
    allow(table).to receive(:valid_position?).with(4, 4).and_return(true)
    allow(table).to receive(:valid_position?).with(6, 6).and_return(false)
    allow(table).to receive(:valid_position?).with(5, 5).and_return(true)
    allow(table).to receive(:valid_position?).with(5, 6).and_return(false)
    allow(table).to receive(:valid_position?).with(6, 5).and_return(false)
    allow(table).to receive(:valid_position?).with(0, 0).and_return(true)
    allow(table).to receive(:valid_position?).with(0, -1).and_return(false)
    allow(table).to receive(:valid_position?).with(-1, 0).and_return(false)
    allow(table).to receive(:valid_position?).with(4, 5).and_return(true)
    allow(table).to receive(:valid_position?).with(5, 4).and_return(true)
    allow(table).to receive(:valid_position?).with(4, 3).and_return(true)
    allow(table).to receive(:valid_position?).with(3, 4).and_return(true)
    Robot.new(table)
  end

  context 'when it is initialized' do
    it 'should not be placed' do
      expect(robot.instance_variable_get(:@placed)).to eq(false)
    end

    it 'should have directions' do
      expect(robot.instance_variable_get(:@directions)).to eq([:NORTH, :EAST, :SOUTH, :WEST])
    end
  end

  context 'when it is placed' do
    it 'raise exception if direction is unreal' do
      expect { robot.place(4, 4, "UNREAL DIRECTION")}.to raise_error(RuntimeError, "Direction should only be NORTH, EAST, SOUTH or WEST")
    end

    it 'initilize variables if robot is on the table' do
      robot.place(4, 4, :NORTH)
      expect(robot.instance_variable_get(:@placed)).to eq(true)
      expect(robot.instance_variable_get(:@facing)).to eq(:NORTH)
      expect(robot.instance_variable_get(:@position)).to eq([4, 4])
    end

    it 'raise exception if place robot is out of table' do
      expect { robot.place(6, 6, :NORTH) }.to raise_error(RuntimeError, "Position is not on the table")
      expect(robot.instance_variable_get(:@placed)).to eq(false)
    end
  end

  context 'when it is not placed' do
    it 'raise exception if it tries to move' do
      pending

    end

    it 'raise exception if it tries to turn left' do
      pending

    end

    it 'raise exception if it tries to turn right' do
      pending

    end

    it 'raise exception if it tries to report' do
      pending

    end

  end

  context 'when it moves' do
    context 'raise exception if moves out of the table' do
      it 'towards NORTH' do
        robot.place(5, 5, :NORTH)
        expect { robot.move }.to raise_error(RuntimeError, "Position is not on the table")
      end

      it 'towards SOUTH' do
        robot.place(0, 0, :SOUTH)
        expect { robot.move }.to raise_error(RuntimeError, "Position is not on the table")
      end

      it 'towards EAST' do
        robot.place(5, 5, :EAST)
        expect { robot.move }.to raise_error(RuntimeError, "Position is not on the table")
      end

      it 'towards WEST' do
        robot.place(0, 0, :WEST)
        expect { robot.move }.to raise_error(RuntimeError, "Position is not on the table")
      end
    end

    context 'on the table' do
      it 'towards NORTH' do
        robot.place(4, 4, :NORTH)
        robot.move
        expect(robot.instance_variable_get(:@position)).to eq([4, 5])
      end

      it 'towards SOUTH' do
        robot.place(4, 4, :SOUTH)
        robot.move
        expect(robot.instance_variable_get(:@position)).to eq([4, 3])
      end

      it 'towards EAST' do
        robot.place(4, 4, :EAST)
        robot.move
        expect(robot.instance_variable_get(:@position)).to eq([5, 4])
      end

      it 'towards WEST' do
        robot.place(4, 4, :WEST)
        robot.move
        expect(robot.instance_variable_get(:@position)).to eq([3, 4])
      end
    end
  end

  context 'when robot turns' do
    it 'left' do
      robot.place(4, 4, :NORTH)
      robot.left
      expect(robot.instance_variable_get(:@facing)).to eq(:WEST)
    end

    it 'right' do
      robot.place(4, 4, :NORTH)
      robot.right
      expect(robot.instance_variable_get(:@facing)).to eq(:EAST)
    end
  end

  context 'when robot report' do
    it 'should report its position and direction' do
      robot.place(4, 4, :NORTH)
      expect(robot.report) .to eq('4, 4, NORTH')
    end
  end

end