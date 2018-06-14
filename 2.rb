# Given an encoded string, return its corresponding decoded string.
# The encoding rule is: k[encoded_string], where the encoded_string inside the
# square brackets is repeated exactly k times. Note: k is guaranteed to be a
# positive integer.

# For s = "4[ab]", the output should be decodeString(s) = "abababab"
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

# Note: this solution only works with 2 levels of nested square brackets

def replace_encoded(str, regex)
  str.scan(regex).each do |x|
    str = str.sub("#{x[0]}[#{x[1]}]", x[1] * x[0].to_i)
  end
  str
end

def decode_string(s)
  # regex to catch multiple encoded
  mult_re = /(\d+)\[(.*?)\]/
  # regex to catch single encoded
  re = /(\d+)\[(.*)\]/
  substring = s.match(re)[2]
  # check that square brackets are nested and replace k[encoded] with encoded * k in substring
  if substring.scan(mult_re).length > 1
    substring = replace_encoded(substring, mult_re)
  elsif substring.scan(re).length == 1
    substring = replace_encoded(substring, re)
  end
  # for each ocurrence of k[encoded], replace it with encoded * k
  s = s.sub(s.match(re)[2], substring)
  s = replace_encoded(s, mult_re)
end

puts decode_string("b3[a]")
puts decode_string("4[ab]")
puts decode_string("2[b3[a]]")
puts decode_string("2[abc]3[cd]ef")
puts decode_string("10[ab2[cde]ed]")
puts decode_string("3[hi2[kay]1[yo]bye]")
