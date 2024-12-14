class Day01
  attr_accessor :records, :part, :left_list, :right_list

  def initialize(part: 1)
    self.records = inputs
    self.part = part
    self.left_list = []
    self.right_list = []
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
  end

  def parse_records
    records.each do |record|
      match = /(?<left>\d+)\s+(?<right>\d+)/.match(record)
      self.left_list << match[:left].to_i
      self.right_list << match[:right].to_i
    end
  end

  def solve_part_1
    parse_records
    left_list.sort!
    right_list.sort!
    differences = []
    left_list.zip(right_list) { |left, right| differences << (left - right).abs }
    differences.sum
  end

  def solve_part_2
    parse_records
    similarity = {}
    left_list.map! do |left|
      similarity[left] || similarity[left] = left * right_list.count(left)
    end
    left_list.sum
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end
