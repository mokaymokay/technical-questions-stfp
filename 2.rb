# Given an encoded string, return its corresponding decoded string.
# The encoding rule is: k[encoded_string], where the encoded_string inside the
# square brackets is repeated exactly k times. Note: k is guaranteed to be a
# positive integer.

# For s = "4[ab]", the output should be decodeString(s) = "abababab"
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

def decode_string(s)
  # start from inside to outside, replace k[encoded] with encoded * k
  re = /(\d+)\[(.*)\]/
  while s.match(re)[2].match(re)
    decoded_inner = s.match(re)[2].sub(s.match(re)[2].match(re)[0], s.match(re)[2].match(re)[2] * s.match(re)[2].match(re)[1].to_i)
    s = s.sub(s.match(re)[2], decoded_inner)
  end
  s.sub(s.match(re)[0], s.match(re)[2] * s.match(re)[1].to_i)
end

puts decode_string("b3[a]")
puts decode_string("4[ab]")
puts decode_string("2[b3[a]]")
