def part2(*data)
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
      increasing = num < report[idx]
      (num - report[idx + 1]).abs if idx < report.length - 1
    end
  end
  sets.count do |set|
    set.compact.each_with_index.all? do |num, idx|
      num >= min && num <= max
    end
  end
end
