require 'simulator'

describe 'toy robot simulator' do
  let(:simulator) { Simulator.new }

  it 'place robot on the table' do
    expect { simulator.execute("PLACE 0,0,NORTH") }.not_to raise_error
  end

  it 'should be able to move robot after place on the table' do
    simulator.execute("PLACE 0,0,NORTH")
    expect { simulator.execute("MOVE") }.not_to raise_error
  end

  it 'should be able to turn left robot after place on the table' do
    simulator.execute("PLACE 0,0,NORTH")
    expect { simulator.execute("LEFT") }.not_to raise_error
  end

  it 'should be able to turn right robot after place on the table' do
    simulator.execute("PLACE 0,0,NORTH")
    expect { simulator.execute("RIGHT") }.not_to raise_error
  end

  it 'should be able to report robot status after place on the table' do
    simulator.execute("PLACE 0,0,NORTH")
    expect { simulator.execute("REPORT") }.not_to raise_error
  end
end