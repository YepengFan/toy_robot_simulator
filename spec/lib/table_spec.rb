require 'table'

describe Table do
  let(:table) { Table.new(5, 5) }
  subject { table }

  it 'should have a valid minimum value of x' do
    expect(table.instance_variable_get(:@min_x)).to eq(0)
  end

  it 'should have a valid minimum value of y' do
    expect(table.instance_variable_get(:@min_y)).to eq(0)
  end

  it 'should have a valid maximum value of x' do
    expect(table.instance_variable_get(:@max_x)).to eq(5)
  end

  it 'should have a valid maximum value of y' do
    expect(table.instance_variable_get(:@max_y)).to eq(5)
  end

  it 'should not validate a position out of range' do
    expect(table.valid_position?(6, 6)).to eq(false)
  end
end