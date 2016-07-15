# Loops 1

## Runaway Loop

```ruby
loop do
  puts 'Just keep pringing...'
  break
end
```

## Loopception

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'
```

## Control the Loop

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"

  iterations += 1
  break if iterations > 5
end
```

## Loop on Command

```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end
```

## Say Hello

```ruby
say_hello = true
iterator = 0

while say_hello
  puts 'Hello!'

  iterator += 1
  say_hello = false if iterator >= 5
end
```

## Print While

```ruby
numbers = []

while numbers.length < 5
  numbers << rand 100
end
```
