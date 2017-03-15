# Easy 1

## Odd Numbers

```python
for i in range(1, 100, 2):
  print(i)
```

## Even Numbers

```python
for i in range(2, 100, 2):
  print(i)
```
## How Big is the Room

```python
sqmeters_to_sqfeet = 10.7639
length = float(input('Enter the length of the room in meters: '))
width = float(input('Enter the width of the room in meters: '))

area_in_meters = length * width
area_in_feet = area_in_meters * sqmeters_to_sqfeet

print('The area of the room is {:.2f} square meters ({:.2f} square feet).'.format(area_in_meters, area_in_feet))
```

## Tip Calculator

```python
bill = float(input('What is the bill?'))
tip_percentage = float(input('What is the tip percentage?'))

tip_amount = bill * (tip_percentage / 100)
total = bill + tip_amount

print('The tip is ${:.2f}'.format(tip_amount))
print('The total is ${:.2f}'.format(total))
```

## Sum or Product of Consecutive Integers

```python
from functools import reduce

def product_to_num(num):
  reduce(lambda x, y: x * y, range(1, num + 1))

def sum_to_num(num):
  reduce(lambda x, y: x * y, range(1, num + 1))

num = int(input('Please enter an integer greater than 0: '))
op = input('Enter "s" to comput the sum, "p" to compute the product: ')[0].lower()

if op == 's':
  answer = sum_to_num(num)
  print('The sum of the integers between 1 and {} is {}.'.format(num, answer))
elif op == 'p':
  answer = product_to_num(num)
  print('The product of the integers between 1 and {} is {}.'.format(num, answer))
else:
  print('wrong input.')
```

## Short Long Short

```python
def short_long_short(str1, str2):
  long = max(str1, str2, key=len)
  short = min(str1, str2, key=len)
  return short + long + short
```

## Leap Years Part 1

```python
def is_leap_year(year):
  return year % 4 == 0 and not (year % 100 == 0 and year % 400 != 0)
```

## Leap Years Part 2

```python
def is_leap_year(year):
  GEORGIAN_CALENDAR_START_DATE = 1752
  if year < GEORGIAN_CALENDAR_START_DATE:
    return year % 4 == 0
  else:
    return year % 4 == 0 and not (year % 100 == 0 and year % 400 != 0)
```

## Multiples of 3 and 5

```python
from functools import reduce

def multisum(num):
  multipleof = lambda n, divisor: n % divisor == 0
  isvalid = lambda n: multipleof(n, 3) or multipleof(n, 5)
  return reduce(
    lambda mem, val: mem + val if isvalid(val) else mem,
    range(1, num + 1),
    0)
```

## ASCII String Value

```python
from functools import reduce

def ascii_value(string):
  return reduce(lambda mem, val: mem + ord(val), string, 0)
```
