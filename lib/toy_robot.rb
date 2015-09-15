require_relative 'robot'
require_relative 'table'

prompt = '> '

puts "Hi there,"
puts "Welcome to the Toy Robot Simulator"
puts "VALID COMMANDS: MOVE, LEFT, RIGHT, REPORT, PLACE"
puts "To get started the Robot needs to be placed on the table which has a size of 5x5."
puts "Valid Place Command example: PLACE 0,5,NORTH", prompt


@table = Table.new(5,5)

def control_robot(input)

  return if input.strip.empty?

  tokens = input.split(/\s+/)
  command = tokens.first
  place_arguments = tokens.last.split(/,/)

  x = place_arguments[0].to_i
  y = place_arguments[1].to_i
  bearing = place_arguments[2]

  case command
  when "PLACE"
    return "Invalid Coordinates" if !(@table.coords_are_on_table?(x,y))
      
    if !(["NORTH","SOUTH","EAST","WEST"].include? bearing)
      return "Invalid Bearing #{bearing}."
    elsif !(@robot) 
      @robot = Robot.new(bearing,x,y,@table)
      return nil
    else
      @robot.place(x,y,bearing)
    end
    
  when "REPORT"
    @robot.report
  when "MOVE"
    @robot.move
  when "LEFT"
    @robot.left
  when "RIGHT"
    @robot.right
  else
    "Ignoring invalid command #{command}."
  end

end


input = STDIN.gets
while input
  output = control_robot(input)
  puts output if output
  input = STDIN.gets
end

