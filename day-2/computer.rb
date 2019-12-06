HALT = 99
ADD = 1
MULT = 2

def run_command(intcodes, step = 0)
  op, np_one, np_two, place_to = intcodes.slice(step, step + 4)
  return intcodes[0] if op == HALT
  case op
  when ADD
    intcodes[place_to] = intcodes[np_one] + intcodes[np_two]
  when MULT
    intcodes[place_to] = intcodes[np_one] * intcodes[np_two]
  else
    raise 'Invalid Operation'
  end
  run_command(intcodes, step + 4)
end

# Before running the program, replace position 1 with the value 12 and replace 
# position 2 with the value 2.

file_path = File.expand_path('../../fixtures/commands.txt', __FILE__)
intcodes = File.read(file_path).split(",").map(&:to_i)
intcodes[1] = 12
intcodes[2] = 2

puts run_command(intcodes)
