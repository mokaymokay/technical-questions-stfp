# Your quirky boss collects rare, old coins. They found out you're a programmer
# and asked you to solve something they've been wondering for a long time.
#
# Write a function that, given an amount of money and an array of coin
# denominations, computes the number of ways to make the amount of money with
# coins of the available denominations.
#
# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your
# program would output 4—the number of ways to make 4¢ with those denominations:
#
# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

# This is a really inefficient solution but it truly demonstrates the power of Ruby (as well as my resourcefulness)

def change_possibilities(amount,denominations)
  # create array of all repeated permutations with length up to amount
  possibilities = []
  n = 1
  while n <= amount
    possibilities.push(denominations.repeated_permutation(n).to_a)
    n += 1
  end
  # sort each permutation by order to get only unique then keep those whose sum equals to amount
  possibilities = possibilities.flatten(1).map { |p| p.sort }.uniq.keep_if { |p| p.inject(:+) == amount }
  # make more readable for the boss
  possibilities.each do |p|
    p.map! { |c| "#{c}¢" }
    puts p.join(', ')
  end
  # output
  possibilities.length
end

puts change_possibilities(4,[1,2,3])
puts change_possibilities(10,[1,2,3,4])
