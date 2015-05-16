require 'simulator'

describe Simulator do
  let(:simulator) { Simulator.new }
  let(:table) { double }
  let(:robot) { double }

  context 'when received invalid place command' do
    it 'raise exception when the command is too long' do
      expect { simulator.execute("PLACE this is a very long command") }.to raise_error(RuntimeError, "Invalid place command")
    end

    it 'raise exception when the command have invalid position valud' do
      expect { simulator.execute("PLACE a,b,NORTH") }.to raise_error(RuntimeError, "Invalid position value")
    end
  end

  context 'when received valid place command' do
    it 'places robot' do
      expect { simulator.execute("PLACE 1,2,NORTH") }.not_to raise_error
    end
  end
end