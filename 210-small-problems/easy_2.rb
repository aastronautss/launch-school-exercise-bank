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

