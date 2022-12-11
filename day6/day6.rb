require '../aoc_fetch'

class CommunicationsDevice
  def initialize(signal)
    @signal = signal
  end

  def marker(distinct_count)
    index = 0
    marker = 0

    signal.each_cons(distinct_count) do |letters|
      break marker = index + distinct_count if letters.uniq.count == distinct_count

      index += 1
    end

    marker
  end

  private

  attr_reader :signal
end

signal = AOCFetch.input(day: 6).read.lines.map(&:chomp).first.chars
comms_device = CommunicationsDevice.new(signal)
puts comms_device.marker(4)
puts comms_device.marker(14)

# bvwbjplbgvbhsrlpgdmjqwftvncz: first marker after character 5
# nppdvjthqldpwncqszvftbrmjlhg: first marker after character 6
# nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: first marker after character 10
# zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: first marker after character 11
