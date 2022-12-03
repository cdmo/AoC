input = IO.foreach('input.txt').map(&:chomp)

ALPHA = ('a'..'z').to_a + ('A'..'Z').to_a

priorities = input.map do |rucksack|
  rucksack_size = rucksack.size
  container_size = rucksack_size / 2

  container1 = rucksack[0...container_size]
  container2 = rucksack[container_size..rucksack_size]

  priority = 0
  container1.each_char do |char|
    priority = (ALPHA.index(char) + 1) if container2.include? char
  end

  priority
end

puts priorities.sum
