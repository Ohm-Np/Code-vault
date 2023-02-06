'''
# set of programs
# all lowercase
# use underscore between two words

# create a function that says hi to the user
# keyword 'def'
def say_hi(name, age):
    print('Hello ' + name + '. Your age is ' + str(age) + '!')

# call the function
say_hi("Om", 27)
'''

# Return statement
# create function to cube a number

from math import *
def cube(number):
    print("Your answer is:")
    return number ** 3

result = cube(4)
print(result)