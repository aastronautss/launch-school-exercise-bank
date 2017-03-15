import random

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

