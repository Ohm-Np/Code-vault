# create classes and using them inside of python
# class - defining what a student is
# object - an actual student

from class_student import Student

student1 = Student("Om", "Geoinformatics", "1.7", False)
student2 = Student("Amrit", "IT", "1.3", True)
print(student1.major)
print(student2.name)