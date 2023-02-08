# (A) reading file to python
# modes: r - read; w - write; a - append; r+ - read and write
'''
iso_file = open("iso.txt", "r")
# read entire file
print(iso_file.read())
# read an individual line
print(iso_file.readline())

# read multiple lines
for iso in iso_file.readlines():
    print(iso)
# print(iso_file.readlines()[3])

# always recommended to close the files at the end
iso_file.close()
'''


# (B) writing and appending the files
iso_file = open("iso.txt", "a")
# add new line with \n
iso_file.write("\nBEL - Belgium")
iso_file.write("\nNOR - Norway")
iso_file.close()

# in order to create new file
# iso_file = open("new_file.txt", "w")