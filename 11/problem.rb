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

def part2(data)
  blinks = 75
  initial_stones = data.split(" ").map(&:to_i)
  post_blink_stones_hash = initial_stones.dup.each_with_object(Hash.new(0)) do |stone, hash|
    hash[stone] += 1
  end

  blinks.times do |i|
    stones = post_blink_stones_hash
    post_blink_stones_hash = Hash.new(0)
    stones.each do |stone, count|
      if stone.zero?
        post_blink_stones_hash[1] += count
      elsif stone.to_s.length.even?
        mid = stone.to_s.size / 2
        post_blink_stones_hash[stone.to_s[0...mid].to_i] += count
        post_blink_stones_hash[stone.to_s[mid..-1].to_i] += count
      else
        post_blink_stones_hash[2024 * stone] += count
      end
    end
  end
  post_blink_stones_hash.values.sum
end

# output(1, :test_input)
# output(1, :input)

start_time = Time.now
output(2, :input)
end_time = Time.now
puts "Took: #{end_time - start_time} seconds"

# output(2, :input)
