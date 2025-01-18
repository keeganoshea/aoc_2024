# frozen_string_literal: true

def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"

def parse(input)= input.each_line.map(&:chomp)

def part1(data)
  blinks = 25
  initial_stones = data.split(" ").map(&:to_i)
  post_blink_stones = initial_stones.dup
  blinks.times do |i|
    stones = post_blink_stones
    post_blink_stones = []
    stones.each do |stone|
      if stone.zero?
        post_blink_stones << 1
      elsif stone.to_s.length.even?
        mid = stone.to_s.size / 2
        post_blink_stones << stone.to_s[0...mid].to_i
        post_blink_stones << stone.to_s[mid..-1].to_i
      else
        post_blink_stones << 2024 * stone
      end
    end
  end
  post_blink_stones.length
end

def part2(*data)= data

# output(1, :test_input)
output(1, :input)

# output(2, :example)
# output(2, :input)
