# Sort the letters in the string s by the order they occur in the string t.
# You can assume t will not have repetitive characters. For s = "weather" and
# t = "therapyw", the output should be sortByString(s, t) = "theeraw".
# For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

def sort_by_strings(s,t)
  # for each char in t, get count of how many times (can be 0) it exists in s and add to output
  output = ""
  t.each_char do |char|
    output += char * s.count(char)
  end
  output
end

puts sort_by_strings("weather", "therapyw")
puts sort_by_strings("good", "odg")
