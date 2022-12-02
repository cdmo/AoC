calories_raw = IO.foreach('input.txt').map(&:chomp)

current_elf = []
organized_by_elf = []

calories_raw.each do |food|
  if food != ''
    current_elf << food.to_i
  else
    organized_by_elf << current_elf
    current_elf = []
  end
end

puts 'day 1, part 1'
puts organized_by_elf.max_by(&:sum).sum

puts 'day 1, part 2'
puts organized_by_elf.map(&:sum).sort.slice(-3..-1).sum
