require_relative 'robot'
require_relative 'table'

prompt = '> '

puts "Hi there,"
puts "Welcome to the Toy Robot Simulator"
puts "To get started the Robot needs to be placed on the table which has a size of 5x5."
puts "Valid Place Command example: PLACE 0,0,NORTH", prompt

@table = Table.new(4,4)
@robot = Robot.new

def place_robot(args)

  x = args[0].to_i
  y = args[1].to_i

  return "Invalid Coordinates, please try again.(VALID eg. PLACE 0,0,NORTH)" unless (@table.coords_are_on_table?(x,y))

  bearing = args[2]

  return "Invalid PLACE command, please try again.(VALID eg. PLACE 0,0,NORTH)" unless (["NORTH","SOUTH","EAST","WEST"].include? bearing)

  @robot.place(bearing,x,y,@table)
end

def control_robot(input)

  return if input.strip.empty?

  tokens = input.split(/\s+/)
  command = tokens.first
  place_arguments = tokens.last.split(/,/)

  case command
  when "PLACE"
    place_robot(place_arguments)
  when "REPORT"
    return "Please place the robot on the table" unless @robot.bearing
    @robot.report
  when "MOVE"
    return "Please place the robot on the table" unless @robot.bearing
    @robot.move
  when "LEFT"
    return "Please place the robot on the table" unless @robot.bearing
    @robot.left
  when "RIGHT"
    return "Please place the robot on the table" unless @robot.bearing
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

