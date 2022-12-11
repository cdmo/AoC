require 'open-uri'

class AOCFetch
  URL = 'https://adventofcode.com/2022/day/'

  def self.input(day: 1)
    URI.open("#{URL}#{day}/input", 'Cookie' => "session=#{cookie}")
  end

  def self.cookie
    ENV['AOC_COOKIE']
  end
end
