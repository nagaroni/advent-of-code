def calculate_fuel_needed(tail, acc = 0)
  return acc if tail.size == 0
  head = tail.shift
  result = (head / 3).floor - 2
  if result == 0 || result < 0
    calculate_fuel_needed(tail, acc)
  else
    calculate_fuel_needed(tail + [result], acc + result)
  end
end


file_path = File.expand_path('../../fixtures/modules.txt', __FILE__)

modules = File.read(file_path).split("\n").map(&:to_i)

puts calculate_fuel_needed(modules)
