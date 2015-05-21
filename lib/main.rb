require_relative 'simulator'

simulator = Simulator.new
command = gets.chomp
while command
  output = simulator.execute(command)
  command = gets.chomp
end

