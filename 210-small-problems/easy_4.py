import math
from functools import reduce

# Cute Angles

def dms(angle):
    degrees = int(angle)
    minutes = math.floor((angle - degrees) * 60)
    seconds = math.floor(
        (angle - degrees - (minutes / 60) * 3600)
    )
    return '%d\xB0%02d\'%02d"' % degrees, minutes, seconds

# Combining Arrays

def union(list1, list2):
    return list(set(list1) | set(list2))

# Halvsies

def halvsies(sequence):
    center = math.ceil(len(sequence) / 2)
    return [sequence[0:center], sequence[center:]]

# Find the Duplicate

def find_dup(sequence):
    seen = set()
    for ele in sequence:
        if ele in seen:
            return ele
        else:
            seen.add(ele)

# Combine Two Lists

def interleave(list1, list2):
    pairs = [[list1[i], list2[i]] for i in range(len(list1))]
    return [ele for sublist in pairs for ele in sublist]

# Multiplicative Average

def show_mult_average(sequence):
    return reduce(lambda x, y: x * y, sequence) / len(sequence)

# Multiply Lists

def multiply_list(list1, list2):
    return [list1[i] * list2[i] for i in range(len(list1))]

# Digits List

def digit_list(num):
    return list(map(lambda ele: int(ele), list(str(num))))

# How Many

def count_occurrences(sequence):
    counts = {}
    for ele in sequence:
        counts[ele] = counts[ele] + 1 if ele in counts else 1

    for key in counts:
        print('{} => {}'.format(key, counts[key]))

# Int Average

def average(sequence):
    sum = lambda seq: reduce(lambda x, y: x + y, seq)
    return round(sum(sequence) / len(sequence))
