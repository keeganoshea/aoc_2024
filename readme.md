https://adventofcode.com/2024

Template
```
# frozen_string_literal: true

def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"

def parse(input)= input.each_line.map(&:chomp)

def part1(*data)= data
def part2(*data)= data

output(1, :example)
# output(1, :input)

# output(2, :example)
# output(2, :input)
```
