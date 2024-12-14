class Day00
  attr_accessor :records, :part

  PARSE_REGEX = /.*/

  def initialize(part: 1)
    self.records = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    begin
      File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
    rescue Errno::ENOENT
      return []
    end
  end

  def parse_records
    records.each do |record|
      self.records = PARSE_REGEX.match(record)
    end
  end

  def solve_part_1
    parse_records
    records.count
  end

  def solve_part_2
    parse_records
    records.count
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end
