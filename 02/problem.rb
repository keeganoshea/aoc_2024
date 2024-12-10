# frozen_string_literal: true

# Setup
def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"
# Input
# 7 6 4 2 1
# 1 2 7 8 9
# 9 7 6 2 1
# 1 3 2 4 5
# 8 6 4 4 1
# 1 3 6 7 9

def parse(input)= input.each_line.map { |line| line.split(' ').map(&:to_i) }
# Output
# [[7, 6, 4, 2, 1],
#  [1, 2, 7, 8, 9],
#  [9, 7, 6, 2, 1],
#  [1, 3, 2, 4, 5],
#  [8, 6, 4, 4, 1],
#  [1, 3, 6, 7, 9]]

# # Solutions
def part1(data)
  diffs = data.map { _1.each_cons(2).map { |a,b| a - b } }
  valid_direction_diffs = diffs.select { _1.all?(&:positive?) || _1.all?(&:negative?) }
  valid_direction_diffs.count { |diff| diff.all? { |d| (1..3).cover?(d.abs) } }
end

def part2(data)
  min = 1
  max = 3
  valid_directions = data.map do |report|
    increasing = report[0] < report[1]
    all_valid = report.map.with_index do |num, idx|
      direction = increasing ? :< : :>
      if increasing
        break report if report == report.sort
      else
        break report if report == report.sort.reverse
      end

      if !num.send(direction, report[idx + 1])
        report.delete_at(idx)
        break report
      else
        report
      end
    end
    all_valid.compact.flatten
  end
  sets = valid_directions.compact.map do |report|
    report.map.with_index do |num, idx|
      (num - report[idx + 1]).abs if idx < report.length - 1
    end
  end
  sets.count do |set|
    set.compact.each_with_index.all? do |num, idx|
      num >= min && num <= max
    end
  end
end


# output(1, :test_input)
output(1, :input)
# output(2, :test_input)
# output(2, :input)

