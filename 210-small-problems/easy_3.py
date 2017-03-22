import random
import datetime
import re

# How Old is Teddy

def print_teddys_age():
    age = random.randrange(20, 201)
    print('Teddy is {} years old!'.format(age))

# Searching 101

def prompt_and_search(list_size):
    element_prompt = lambda i: int(input('Enter number {}: '.format(i + 1)))
    search_list = [element_prompt(x) for x in range(list_size)]
    search_term = int(input('Enter the number to search: '))
    term_found = 'appears' if search_term in search_list else 'does not appear'
    print('The number %d %s in %s' % (search_term, term_found, search_list))

# When Will I Retire

def when_will_i_retire():
    age = int(prompt('What is your age?' ))
    retire_age = int(prompt('At what age would you like to retire? '))
    current_year = datetime.date.today().year
    years_till_retirement = retire_age - age
    retirement_year = current_year + years_till_retirement

    print("It's %d. You will retire in %d" % current_year, retirement_year)
    print('You have only %d years of work to go!' % years_till_retirement)

# Palindromic Strings Part 1

def is_palindrome(string):
    return string[::-1] == string

# Palindromic Strings Part 2

def is_real_palindrome(string):
    alphanum_only = re.sub(r'[^a-zA-Z0-9]', '', string)
    return alphanum_only == alphanum_only[::-1]

# Palindromic Number

def is_palindromic_number(num):
    return str(num) == str(num)[::-1]

# Running Totals

def running_total(sequence):
    return list(map(
        lambda i: sequence[i - 1] + sequence[i] if i > 0 else sequence[i],
        range(len(sequence))
    ))

# Letter Swap

def swap(string):
    words = string.split(' ')
    swapped_words = map(lambda word: word[-1] + word[1:-1] + word[0], words)
    return ' '.join(swapped_words)

# Letter Counter Part 1

def word_sizes(string):
    counts = {}
    for word in string.split(' '):
        length = len(word)
        counts[length] = 1 if not counts.get(length) else counts[length] + 1
    return counts

# Letter Counter Part 2

def word_sizes_proper(string):
    counts = {}
    for word in string.split(' '):
        length = len(re.sub(r'[^a-zA-Z]', '', word))
        counts[length] = 1 if not counts.get(length) else counts[length] + 1
    return counts
