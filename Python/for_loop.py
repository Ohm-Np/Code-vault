# for loops in python
# loop over different collection of items (numbers, strings)
'''
for letter in "Om Bhandari":
    print(letter)
'''

friends = ["Ram", "Sita", "Laxman", "Bharat"]
# print the name in the lists
for f in friends:
    print(f)

for index in range(len(friends)):
    if index == 0:
        print("first iteration")
    else:
        print("not first")

