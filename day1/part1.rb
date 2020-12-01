entries = File.readlines('entries.txt').map(&:to_i)
desired_sum = 2020
product = 0

combinations = entries.combination(2).to_a
combinations.each do |arr|
  next if desired_sum != arr.sum
  product = arr.reduce(1, :*)
  break
end

puts product
