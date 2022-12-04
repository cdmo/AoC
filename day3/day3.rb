input = IO.foreach('input.txt').map(&:chomp)

ALPHA = ('a'..'z').to_a + ('A'..'Z').to_a

# priorities = input.map do |rucksack|
#   rucksack_size = rucksack.size
#   container_size = rucksack_size / 2

#   container1 = rucksack[0...container_size]
#   container2 = rucksack[container_size..rucksack_size]

#   priority = 0
#   container1.each_char do |char|
#     priority = (ALPHA.index(char) + 1) if container2.include? char
#   end

#   priority
# end

# puts priorities.sum

badges_priorities_sum = 0
index = -1

input.each_cons(3) do |trio|
  puts "index: #{index}"
  index += 1
  next if index % 3 != 0

  badge = (trio[0].chars & trio[1].chars & trio[2].chars).first
  # binding.irb if badge.nil?
  puts "badge: #{badge}"
  puts "index: #{ALPHA.index(badge)}"
  badge_priority = (ALPHA.index(badge) + 1)
  badges_priorities_sum += badge_priority
end

puts badges_priorities_sum
