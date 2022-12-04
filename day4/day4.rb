assignments_pairs = IO.foreach('input.txt').map(&:chomp)

count = assignments_pairs.map do |assignment_pair|
  first_assignment = assignment_pair.split(',').first.split('-')
  second_assignment = assignment_pair.split(',').last.split('-')

  first_assignment_list = Range.new(first_assignment.first.to_i, first_assignment.last.to_i).to_a
  second_assignment_list = Range.new(second_assignment.first.to_i, second_assignment.last.to_i).to_a

  smaller_list = first_assignment_list.length < second_assignment_list.length ? first_assignment_list : second_assignment_list

  in_both = first_assignment_list & second_assignment_list

  1 if in_both == smaller_list
end.compact

## day4 part 1
puts count.sum

count2 = assignments_pairs.map do |assignment_pair|
  first_assignment = assignment_pair.split(',').first.split('-')
  second_assignment = assignment_pair.split(',').last.split('-')

  first_assignment_list = Range.new(first_assignment.first.to_i, first_assignment.last.to_i).to_a
  second_assignment_list = Range.new(second_assignment.first.to_i, second_assignment.last.to_i).to_a

  1 if first_assignment_list & second_assignment_list != []
end.compact

puts count2.sum
