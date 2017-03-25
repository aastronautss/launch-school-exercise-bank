import re

# Uppercase

def is_uppercase(string):
    letters = re.sub(r'[^a-zA-Z]', '', string)
    return all(re.match(r'[A-Z]', letter) for letter in letters)

# Delete Vowels

def remove_vowels(words):
    VOWELS = r'[aeiouAEIOU]'
    return [re.sub(VOWELS, '', word) for word in words]
