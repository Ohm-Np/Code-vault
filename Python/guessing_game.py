# build a basic guessing game
# if, while, variables
# specify a secret word - user interact with the program until
# they get secret word right

'''
secret_word = "giraffe"
guess = ""

while guess != secret_word:
    guess = input("Enter guess: ")

print("You win!")
'''

secret_word = "giraffe"
guess = ""
guess_count = 0
guess_limit = 3
out_of_guesses = False

while guess != secret_word and not(out_of_guesses):
    if guess_count < guess_limit:
        guess = input("Enter guess: ")
        guess_count += 1
    else:
        out_of_guesses = True

if out_of_guesses:
    print("SORRY! You are out of guesses! Try again!")
else:
    print("HURRAH! You are the winner!")