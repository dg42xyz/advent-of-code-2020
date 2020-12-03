entries = File.readlines('entries.txt', chomp: true)

locations = entries.map { |line| line.split('') }
trees = []
x = 0
y = 0

while y < entries.length - 1
  x += 3
  x %= locations[0].length
  y += 1

  trees.push([x, y]) if locations[y][x] == '#'
end

puts trees.length
