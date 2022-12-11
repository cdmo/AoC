require '../aoc_fetch'
require 'minitest/autorun'

class CrateMover
  attr_reader :stacks

  LINE_BREAK = 1

  def initialize(instructions)
    @stacks_diagram = instructions.take_while { |line| line != '' }
    @stacks_diagram.pop

    instructions_begin_index = (instructions.index { |line| line == '' } + LINE_BREAK)
    @instructions = instructions.last(instructions.size - instructions_begin_index)
    set_stacks
  end

  def move_crates_9000
    instructions.each do |instruction|
      move = parse_instruction(instruction)
      crates_to_move = @stacks[move[:from]].shift(move[:count])
      crates_to_move.each { |crate| @stacks[move[:to]].unshift(crate) }
    end
  end

  def move_crates_9001
    instructions.each do |instruction|
      move = parse_instruction(instruction)
      crates_to_move = @stacks[move[:from]].shift(move[:count])
      @stacks[move[:to]] = crates_to_move + @stacks[move[:to]]
    end
  end

  private

  attr_reader :stacks_diagram, :instructions

  def set_stacks
    row_length = stacks_diagram.first.length
    extra_padding_after_last_column = 1
    column_width_and_padding = 4
    stack_count = (row_length + extra_padding_after_last_column) / column_width_and_padding

    @stacks = []

    stacks_diagram.each do |row|
      row_point = 1

      stack_count.times do |i|
        @stacks[i] ||= []
        letter = row[row_point]
        @stacks[i].append(row[row_point]) unless letter == ' '
        row_point += 4
      end
    end
  end

  def parse_instruction(line)
    nums = line.scan(/\d+/).map(&:to_i)
    {
      count: nums[0],
      from: nums[1] - 1,
      to: nums[2] - 1
    }
  end
end

instructions = AOCFetch.input(day: 5).read.lines.map(&:chomp)

stack_mover = CrateMover.new(instructions)
stack_mover.move_crates_9000
puts stack_mover.stacks.map(&:first).join('')

stack_mover = CrateMover.new(instructions)
stack_mover.move_crates_9001
puts stack_mover.stacks.map(&:first).join('')

class CrateMoverTest < Minitest::Test
  def test_move_crates
    stack_mover = CrateMover.new(IO.readlines('test.txt').map(&:chomp))

    stack_mover.move_crates_9000

    assert_equal stack_mover.stacks, [['C'], ['M'], %w[Z N D P]]
    assert_equal stack_mover.stacks.map(&:first).join(''), 'CMZ'
  end

  def test_move_crates_9001
    stack_mover = CrateMover.new(IO.readlines('test.txt').map(&:chomp))

    stack_mover.move_crates_9001

    assert_equal stack_mover.stacks, [['M'], ['C'], %w[D N Z P]]
    assert_equal stack_mover.stacks.map(&:first).join(''), 'MCD'
  end
end
