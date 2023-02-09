# class - defining what a student is
# object - an actual student
# datatype Student

class Student:
    def __init__(self, name, major, gpa, is_on_probation):
        self.name = name
        self.major = major
        self.gpa = gpa
        self.is_on_probation = is_on_probation

    def on_honor_roll(self):
         if self.gpa <= 1.5:
             return True
         else:
             return False

# note
# self.name - name of the student is going to be equal to
# name - the name that we passed in

