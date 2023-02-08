# 2 dimensional lists

# one list with 4 elements
# all elements themselves are list
num_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]

# access 1
print(num_grid[0][0])

# access 6
print(num_grid[1][2])

# access 0
print(num_grid[3][0])

# nested for loops (for inside for)
# access all elements from the grid above

for row in num_grid:
    for col in row:
        print(col)