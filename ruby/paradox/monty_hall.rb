# Monty Hall problem
doors = (0..2).to_a
switch_wins, stay_wins = 0, 0
loop_count = ARGV[0]&.to_i || 10000

raise "loop count fault for #{loop_count}" if loop_count <= 0

(1..loop_count).each do
  random = Random.new
  car_door = random.rand 3
  choice_door = random.rand 3
  opened_door = (doors - [car_door, choice_door]).sample
  switched_choice = (doors - [opened_door, choice_door]).sample

  switch_wins += 1 if switched_choice == car_door
  stay_wins += 1 if choice_door == car_door
end

puts "in #{loop_count} times choice:"
puts "switch door win percent: #{switch_wins.to_f / loop_count}"
puts "stay choice win percent: #{stay_wins.to_f / loop_count}"
