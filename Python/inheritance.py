# Inheritance - where we can define a few attributes and functions ...
# ... and things inside of a class ...
# ... and then we can create another class, and we can inherit ...
# ... all of those attributes!

from inherit_chef import Chef
from inherit_chineseChef import ChineseChef

myChef = Chef()
myChef.make_special()

ChineseChef = ChineseChef()
ChineseChef.make_special()