class Day02
  attr_accessor :records, :part

  PARSE_REGEX = /\d+/

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
    records.map! do |record|
      record.scan(PARSE_REGEX).map(&:to_i)
    end
  end

  # TODO - for part 2, 
  # if the first one needs to be skipped for it to be a safe report
  # this method has no way to do that
  # Also, write some tests
  # 10, 12, 8, 6, 5 <- elimates 8 and fails
  # 10, 9, 10, 11, 12 <- need to eliminate 10
  # Use first and last value to determine direction?
  # Eliminating first value... :/
  def safe_report?(report)
    last_level, increasing, skip_level = nil, nil, 0
    report.each do |level|
      increasing = (last_level&.< level) if increasing.nil?
      case
      when last_level.nil?
        last_level = level
        next
      when last_level == level
        if part == 2 && skip_level == 0
          skip_level += 1 && next
        end
        return false
      when last_level < level # increasing
        if level > last_level + 3 || !increasing
          if part == 2 && skip_level == 0
            skip_level += 1
            next
          else
            return false
          end
        end
      when last_level > level # decreasing
        if level < last_level - 3 || increasing
          if part == 2 && skip_level == 0
            skip_level += 1
            next
          else
            return false
          end
        end
      end
      last_level = level
    end
    true
  end

  def solve
    parse_records
    records.count(&method(:safe_report?))
  end
end
