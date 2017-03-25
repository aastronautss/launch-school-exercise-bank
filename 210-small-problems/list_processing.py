from functools import reduce

# Alphabetical Numbers

def alphabetical_number_sort(nums):
    number_words = [
        'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
        'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
        'sixteen', 'seventeen', 'eighteen', 'nineteen'
    ]
    return sorted(nums, key=lambda i: number_words[i])

# Sum of Digits

def sum_of_digits(num):
    digits = list(map(lambda x: int(x), list(str(num))))
    return reduce(lambda x, y: x + y, digits)

# Multiply All Pairs

def multiply_all_pairs(list1, list2):
    return sorted([x * y for x in list1 for y in list2])

# Sum of Sums

def sum_of_sums(nums):
    lists = list(map(lambda i: nums[:i+1], range(len(nums))))
    return sum([sum(sublist) for sublist in lists])

# Leading Substrings

def substrings_at_start(string):
    return [string[:i + 1] for i in range(len(string))]

# All Substrings

def substrings(string):
    return [string[i:j + 1] for i in range(len(string)) for j in range(len(string)) if len(string[i:j + 1]) > 0]

# Palindromic Strings

def palindromes(string):
    return [s for s in substrings(string) if len(s) > 1 and s == s[::-1]]

# Grocery List

def buy_fruit(frequencies):
    fruits = []
    for frequency in frequencies:
        fruits += [frequency[0] for count in range(frequency[1])]
    return fruits

# Inventory Item Transactions

def transactions_for(id, transactions):
    return filter(lambda transaction: transaction['id'] == id, transactions)

# Inventory Item Availability

def is_item_available(id, transactions):
    item_transactions = transactions_for(id, transactions)
    inventory = 0
    for trans in item_transactions:
        inventory += trans['quantity'] if trans['movement'] == 'in' else -trans['quantity']
    return inventory > 0
