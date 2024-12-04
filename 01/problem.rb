# frozen_string_literal: true

# Setup
def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"
# Input
# 3   4
# 4   3
# 2   5
# 1   3
# 3   9
# 3   3
def parse(input)= input.each_line.map { |line| line.split.map(&:to_i) }.transpose
print parse(file(:test_input))
# Output
# [[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]]

# Solutions
def part1(a, b)
  a.sort.zip(b.sort).sum { |x, y| (x - y).abs }
end
# Naive solution:
def part2(a, b) = a.sum { |av| av * b.count { |bv| bv == av}}
# Optimized solution:
def part3(*data)
  a, b = data.map { |d| d.group_by(&:itself).transform_values(&:count) }
  a.keys.sum { |k| (k * a[k] || 0) * (b[k] || 0) }
end

output(1, :test_input)
output(1, :input)
output(2, :test_input)
output(2, :input)
output(3, :input)
