# Reading Documentation 2

## Methods Without Arguments

`'xyz'.upcase`

## Required Arguments

```ruby
a.insert 3, 5, 6, 7
```

## Optional Arguments

```ruby
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
#=> ['abc', 'def', 'ghi,jkl', 'mno', 'pqr,stu', 'vwx', 'yz']
puts s.split(',').inspect
#=> ['abc def ghi', 'jkl mno pqr', 'stu vwx yz']
puts s.split(',', 2).inspect
#=> ['abc def ghi', 'jkl mno pqr,stu vwx yz']
```

## Optional Arguments Redux

```ruby
require 'date'

puts Date.new
#=> -4712-01-01
puts Date.new(2016)
#=> 2016-01-01
puts Date.new(2016, 5)
#=> 2016-05-01
puts Date.new(2016, 5, 13)
#=> 2016-05-13
```

## Mandatory Blocks

```ruby
a.bsearch { |num| num > 8 }
```

## Multiple Signatures

```ruby
a = %w(a b c d e)

puts a.fetch(7)
#=> IndexError
puts a.fetch(7, 'beats me')
#=> 'beats me'
puts a.fetch(7) { |index| index**2 }
#=> 49
```

## Keyword Arguments

```
5
8
```

## Parent Class

```ruby
s = 'abc'
ancestor_methods = s.class.superclass.public_methods
p s.public_methods.reject { |method| ancestor_methods.include? method }

# Alternatively...

p s.public_methods(false).inspect
```

## Included Methods

```ruby
puts a.min 2
```

## Down the Rabbit Hole

This particular class is included in `Psych`
