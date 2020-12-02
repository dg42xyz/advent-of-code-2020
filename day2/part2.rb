entries = File.readlines('entries.txt')
valid = []

entries.each do |line|
  pos1, pos2, letter, password = line.split(/\s|\-|\:\s/)
  matches = [password[Integer(pos1) - 1] == letter, password[Integer(pos2) - 1] == letter]
  valid.push(password) if matches.one?(true)
end

puts valid.length
