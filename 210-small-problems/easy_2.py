import random
import re
import math
from functools import reduce

# Ddaaiillyy ddoouubbllee

def crunch(string):
    new_string = ''
    for idx, char in enumerate(string):
        if idx == 0 or char != string[idx - 1]:
            new_string += char
    return new_string

# Bannerizer

def print_in_box(string):
    length = len(string)
    print('+-{}-+'.format('-' * length))
    print('| {} |'.format(' ' * length))
    print('| {} |'.format(string))
    print('| {} |'.format(' ' * length))
    print('+-{}-+'.format('-' * length))

# Stringy Strings

def rotate(items):
    items.append(items.pop(0))

def stringy(num):
    values = ['1', '0']
    output = ''
    for i in range(num):
        output += values[0]
        rotate(values)
    return output

# Fibonacci Number Location by Length

# Right Triangles

def triangle(height):
    for row in range(1, height + 1):
        print(('*' * row).rjust(height))

# Madlibs

def madlibs():
    noun = input('Enter a noun: ')
    verb = input('Enter a verb: ')
    adjective = input('Enter an adjective: ')
    adverb = input('Enter an adverb: ')
    sentences = [
        'Do you {verb} your {adjective} {noun} {adverb}? That\'s hilarious!',
        'The {adjective} {noun} {verb}s {adverb} over the lazy dog.',
        'The {noun} {adverb} {verb}s up {adjective} Joe\'s turtle.'
    ]
    print(random.choice(sentences).format(noun=noun, verb=verb, adjective=adjective, adverb=adverb))

# Double Doubles

def is_double_number(num):
    num_str = str(num)
    center = int(len(num_str) / 2)
    return num_str[0:center] == num_str[center:]

def twice(num):
    return num if is_double_number(num) else 2 * num

# Grade Book

def avg(*nums):
    return reduce(lambda mem, val: mem + val, nums) / len(nums)

def get_grade(*scores):
    average = avg(*scores)
    if average >= 90:
        return 'A'
    elif average >= 80:
        return 'B'
    elif average >= 70:
        return 'C'
    elif average >= 60:
        return 'D'
    else:
        return 'F'

# Clean Up the Words

def cleanup(string):
    return re.sub(r'[^A-Za-z]+', ' ', string)

# Which Century is That

def is_special_th_suffix(num):
    return num % 100 in (11, 12, 13)

def nth_suffix(num):
    special_suffixes = { 1: 'st', 2: 'nd', 3: 'rd' }
    if is_special_th_suffix(num):
        return 'th'
    last_digit = num % 10
    if last_digit in special_suffixes:
        return special_suffixes[last_digit]
    else:
        return 'th'

def century(year):
    century_num = math.ceil(year / 100)
    return '{}{}'.format(century_num, nth_suffix(century_num))
