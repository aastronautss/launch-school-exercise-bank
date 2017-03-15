# Easy 1

## Odd Numbers

```ruby
(1..99).step(2) {|n| puts n }
```

## Even Numbers

```ruby
(2..99).step(2) { |n| puts n }
```

## How Big is the Room

```ruby
SQMETERS_TO_SQFEET = 10.7639
puts 'Enter the length of the room in meters:'
length = Float(gets.strip)
puts 'Enter the width of the room in meters:'
width = Float(gets.strip)

area_in_meters = width * length
area_in_feet = area_in_meters * SQMETERS_TO_SQFEET

puts 'The area of the room is %.2f square meters (%.2f square feet).' % [area_in_meters, area_in_feet]
```

## Tip Calculator

```ruby
puts 'What is the bill?'
bill = Float gets.strip
puts 'What is the tip percentage?'
tip_percentage = Float gets.strip

tip_amount = bill * (tip_percentage / 10)
total = bill + tip_amount

puts 'The tip is %.2f' % tip_amount
puts 'The total is %.2f' % total
```

## Sum or Product of Consecutive Integers

```ruby
def compute_one_to_num(num, op)
  (1..num).inject op
end

OPS = { 's' => :+, 'p' => :* }
puts 'Please enter an integer greater than 0:'
num = Integer gets.strip
puts 'Enter "s" to comput the sum, "p" to compute the product:'
op_key = gets.strip[0].downcase
op = OPS[op_key]

if op
  answer = compute_one_to_num num, op
  puts "'The sum of the integers between 1 and #{num} is #{answer}."
else
  puts 'Wrong operator'
end
```

## Short Long Short

```ruby
def short_long_short(str1, str2)
  long = [str1, str2].max_by &:length
  short = [str1, str2].min_by &:length
  short + long + short
end
```

## Leap Years Part 1

```ruby
def is_leap_year?(year)
  year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0)
end
```

## Leap Years Part 2

```ruby
def is_leap_year?(year)
  GEORGIAN_CALENDAR_START_DATE = 1752
  if year < GEORGIAN_CALENDAR_START_DATE
    year % 4 == 0
  else
    year % 4 == 0 && !(year % 100 == 0 && year % 400 != 0)
  end
end
```

## Multiples of 3 and 5

```ruby
def multisum(num)
  (1..num).inject(0) do |mem, val|
    val % 3 == 0 || val % 5 == 0 ? mem + val : mem
  end
end
```

## ASCII String Value

```ruby
def ascii_value(str)
  str.chars.inject(0) { |mem, val| mem + val.ord }
end
```
