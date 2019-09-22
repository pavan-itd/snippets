# Find and mask the string

```ruby

=begin
String.include?(string)
- Returns true if str contains the given string or character.
String.gsub(pattern, <hash|replacement>)
- Returns a new string with all the occurrences of the pattern substituted for the second argument: .
  The pattern is typically a Regexp, but a string can also be used.
  "hello".gsub(/[aeiou]/, '*')
=end

def mask_article(str, arr)
  arr.each { |word| str.gsub!(word, strike(word)) }
  str
end

def strike(str)
  "<strike>#{str}</strike>"
end

p mask_article("Hello World! This is crap!", ["crap", "World"])

# "Hello World! This is <strike>crap</strike>!"

```
