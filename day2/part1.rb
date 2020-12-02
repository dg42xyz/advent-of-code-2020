entries = File.readlines('entries.txt')
valid = []

entries.each do |line|
  min, max, letter, password = line.split(/\s|\-|\:\s/)
  occurrances = password.scan(/#{letter}/).length
  valid.push(password) if occurrances.between?(Integer(min), Integer(max))
end

puts valid.length
