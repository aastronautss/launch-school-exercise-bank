# Ddaaiillyy ddoouubbllee

def crunch(string)
  string.chars.each_with_index.inject('') do |new_string, (char, idx)|
    idx == 0 || char != string[idx - 1] ? new_string + char : new_string
  end
end

# Bannerizer

def puts_in_box(str)
  puts "+-#{'-' * str.length}-+"
  puts "| #{' ' * str.length} |"
  puts "| #{str} |"
  puts "| #{' ' * str.length} |"
  puts "+-#{'-' * str.length}-+"
end

# Stringy Strings

def stringy(num)
  values = ['0', '1']
  (1..num).map { |idx| values[idx % values.count] }.join ''
end

# Fibonacci Number Location by Length

# Triangle

def triangle(height)
  (1..height).each { |row| puts ('*' * row).rjust(height) }
end

# Madlibs

def madlibs
  puts 'Enter a noun:'
  noun = gets.strip
  puts 'Enter a verb:'
  verb = gets.strip
  puts 'Enter an adjective:'
  adjective = gets.strip
  puts 'Enter an adverb:'
  adverb = gets.strip

  sentences = [
    "Do you #{verb} your #{adjective} #{noun} #{adverb}? That\'s hilarious!",
    "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog.",
    "The #{noun} #{adverb} #{verb}s up #{adjective} Joe\'s turtle."
  ]


  puts sentences.sample
end

# Double Doubles

def double_number?(num)
  num_str = num.to_s
  center = num_str.length / 2
  num_str[0...center] == num_str[center..-1]
end

def twice(num)
  double_number?(num) ? num : num * 2
end

# Grade Book

def avg(*nums)
  nums.inject(:+) / nums.length
end

def get_grade(*scores)
  average = avg *scores
  case average
  when 90..100
    'A'
  when 80...90
    'B'
  when 70...80
    'C'
  when 60...70
    'D'
  else
    'F'
  end
end

# Clean Up the Words

def clean_up(str)
  str.gsub /[^A-Za-z]+/, ' '
end

# What Century is That
SPECIAL_SUFFIXES = { 1 => 'st', 2 => 'nd', 3 => 'rd' }.freeze

def special_th_suffix?(num)
  [11, 12, 13].include? num % 100
end

def nth_suffix(num)
  return 'th' if special_th_suffix? num

  last_digit = num % 10
  SPECIAL_SUFFIXES[last_digit] || 'th'
end

def century(year)
  year_num = (year / 100.0).ceil
  "#{year_num}#{nth_suffix year_num}"
end
