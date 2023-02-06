# if statements and comparisons

# create a function to return maximum number among three inputs

def max_num(num1, num2, num3):
    if num1 >= num2 and num1 >= num3:
        return(num1)
    elif num2 >= num1 and num2 >= num3:
        return(num2)
    else:
        return(num3)

print(max_num(3789, 676, 5))