require 'robot'
require 'table'

describe Robot do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new(table) }

end