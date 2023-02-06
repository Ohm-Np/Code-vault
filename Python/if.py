#  to control the workflow of the program
# if statements

# create a boolean variable
is_male = False
is_tall = False

# or operator
if is_male or is_tall:
    print("You are a male or you are tall or a tall male!")
else:
    print("You are neither male not tall!")

# and operator
if is_male and is_tall:
    print("You are a tall male!")
elif is_male and not(is_tall):
    print("You are a short male!")
elif not(is_male) and is_tall:
    print("You are not a male but are tall!")
else:
    print("You are not a male and not tall!")

