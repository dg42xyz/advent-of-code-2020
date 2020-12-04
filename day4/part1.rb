entries = File.readlines('entries.txt', chomp: true)

mandatory = %w(byr iyr eyr hgt hcl ecl pid)
passport_fields = []
valid = 0

entries.each do |line|
  line_fields = line.split(/\s/)
  line_keys = line_fields.map { |field| field.split(':')[0] }
  passport_fields.concat(line_keys)

  if line.to_s.strip.empty?
    missing_fields = mandatory - passport_fields
    valid += 1 if missing_fields.empty?
    passport_fields = []
  end
end

puts valid
