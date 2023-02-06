"""
friends = ['Pratik', 'Aashish', 'Subhash', 'sagar', 'Meena']
friends[1] = 'Lamsal'
print(friends[1:3])
print(friends[-4])

# List functions
lucky_numbers = [17, 7, 11, 13, 17, 19, 31]
friends = ['Pratik', 'Aashish', 'Pratik', 'Subhash', 'Sagar', 'Meena']

# append list
# friends.extend(lucky_numbers)

# add individual element to the list
# always adds at the last of the list
friends.append("Sita")

# to add element in between the list
friends.insert(1, "Sophie")

# remove elements
# friends.remove('Sagar')
# print(friends)

# empty the list
# friends.clear()
# print(friends)
# to remove only the last one, use friends.pop()

# to find the index of the element
print(friends.index('Sagar'))

# count elements
print(friends.count('Pratik'))

# sort values
friends.sort()
print(friends)
lucky_numbers.sort()
print(lucky_numbers)

# reverse the order
lucky_numbers.reverse()
print(lucky_numbers)

# create another list by copying
friends2 = friends.copy()
print(friends2)
"""