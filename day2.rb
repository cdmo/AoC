raw_input = IO.foreach('input2.txt').map(&:chomp)
# X 1 rock
# Y 2 paper
# Z 3 scissors
# X beats C (scissors) C X
# Y beats A (rock)  A Y
# Z beats B (paper) B Z
# add_6 = ['C X', 'A Y', 'B Z']
# add_3 = ['A X', 'B Y', 'C Z']

# sum = 0
# raw_input.each do |game|
#   sum += 6 if add_6.include? game
#   sum += 3 if add_3.include? game
#   sum += 1 if game[2] == 'X'
#   sum += 2 if game[2] == 'Y'
#   sum += 3 if game[2] == 'Z'
# end

# day 2 part 1
# puts sum

# day 2 part 2
# A Y (draw) = 4
# B  X loss = 1
# Z X win = 7
# add_6 = ['C X', 'A Y', 'B Z']
# add_3 = ['A X', 'B Y', 'C Z']

sum = 0
raw_input.each do |game|
  if game[2] == 'X'
    sum += 3 if game[0] == 'A'
    sum += 1 if game[0] == 'B'
    sum += 2 if game[0] == 'C'
  end
  if game[2] == 'Y'
    sum += 3
    sum += 1 if game[0] == 'A'
    sum += 2 if game[0] == 'B'
    sum += 3 if game[0] == 'C'
  end

  next unless game[2] == 'Z'

  sum += 6
  sum += 2 if game[0] == 'A'
  sum += 3 if game[0] == 'B'
  sum += 1 if game[0] == 'C'
end

puts sum
