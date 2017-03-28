import re

# Uppercase

def is_uppercase(string):
    letters = re.sub(r'[^a-zA-Z]', '', string)
    return all(re.match(r'[A-Z]', letter) for letter in letters)

# Delete Vowels

def remove_vowels(words):
    VOWELS = r'[aeiouAEIOU]'
    return [re.sub(VOWELS, '', word) for word in words]

# Lettercase Counter

def letter_case_count(string):
    cases = {}
    cases['lowercase'] = len(re.sub(r'[^a-z]', '', string))
    cases['uppercase'] = len(re.sub(r'[^A-Z]', '', string))
    cases['neither'] = len(re.sub(r'[a-zA-Z]', '', string))
    return cases

# Capitalize Words

def wordcap(string):
    words = string.split()
    return ' '.join([word.capitalize() for word in words])

# Swap Case

