entries = File.readlines('entries.txt', chomp: true)

locations = entries.map { |line| line.split('') }
traversions = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

treeCounts = traversions.map do |right, down|
  x = 0
  y = 0
  trees = 0

  while y < locations.length - 1
    x += right
    x %= locations[0].length
    y += down

    trees += 1 if locations[y][x] == '#'
  end

  trees
end

totalTrees = treeCounts.reduce(:*)

puts totalTrees
