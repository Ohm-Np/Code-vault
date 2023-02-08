# take a string or phrase ...
# ... and translate into a different language

# Belauri language
# ... vowels -> b

def translate(phrase):
    translation = ""
    for letter in phrase:
        if letter.lower() in "aeiou":
            if letter.isupper():
                translation = translation + "B"
            else:
                translation = translation + "b"
        else:
            translation = translation + letter
    return(translation)

print(translate(input("Enter a phrase: ")))


# bonus tips
# Comments in Python

'''
or multiline comments
print("Here are comments!")
'''