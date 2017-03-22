import re
import math

# Double Char Part 1

def repeater(string):
    return ''.join(list(map(lambda char: char*2, string)))

# Double Char Part 2

def double_consonants(string):
    is_consonant = lambda char: not not re.match(r'[b-df-hj-np-tv-z]', char, re.IGNORECASE)
    cons_doubler = lambda char: char*2 if is_consonant(char) else char
    return ''.join(list(map(cons_doubler, string)))

# Convert number to reversed array of digits

def reversed_number(num):
    return int(str(num)[::-1])

# Get the Middle Character

def centerof(seq):
    center = len(seq) / 2
    if len(seq) % 2 != 0:
        return seq[math.floor(len(seq) / 2)]
    else:
        return seq[math.floor(len(seq)/2 - 1):math.floor(len(seq)/2 + 1)]

# Always Return Negative

def negative(num):
    return -abs(num)

# Counting Up

def sequence(num):
    return list(range(1, num + 1))

# Name Swapping

def swap_name(full_name):
    names = full_name.split(' ')
    return "{}, {}".format(names[1], names[0])

# Sequene Count

def sequence(length, interval):
    return [i * interval for i in range(1, length + 1)]

# Reverse It Part 1

def reverse_sentence(sentence):
    words = sentence.split(' ')
    return ' '.join(words[::-1])

# Reverse It Part 2

def reverse_words(sentence):
    reverse_long_word = lambda word: word[::-1] if len(word) >= 5 else word
    words = sentence.split(' ')
    return ' '.join(map(reverse_long_word, words))
