entries = File.readlines('entries.txt', chomp: true)

mandatory = %w(byr iyr eyr hgt hcl ecl pid)
passport_fields = []
valid_fields = []
valid = 0

entries.each do |line|
  line_fields = line.split(/\s/)
  passport_fields.concat(line_fields)

  if line.to_s.strip.empty?
    passport_fields.each do |field|
      key, value = field.split(':')
      case key
      when 'byr'
        valid_fields.push(key) if value.length == 4 && Integer(value).between?(1920, 2002)
      when 'iyr'
        valid_fields.push(key) if value.length == 4 && Integer(value).between?(2010, 2020)
      when 'eyr'
        valid_fields.push(key) if value.length == 4 && Integer(value).between?(2020, 2030)
      when 'hgt'
        if value.end_with?('cm', 'in')
          unit = value.split('').last(2).join
          height = value[0...-2]
          valid_fields.push(key) if ((unit == 'cm' && Integer(height).between?(150, 193)) || (unit == 'in' && Integer(height).between?(59, 76)))
        end
      when 'hcl'
        valid_fields.push(key) if value.match?(/\#[0-9a-f]{6}/)
      when 'ecl'
        valid_fields.push(key) if %w(amb blu brn gry grn hzl oth).include?(value)
      when 'pid'
        valid_fields.push(key) if value.scan(/\D/).empty? && value.length == 9
      end
    end

    valid += 1 if valid_fields.length == mandatory.length
    passport_fields = []
    valid_fields = []
  end
end

puts valid
