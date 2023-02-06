# key value pairs - key and corresponding values
# key:value
# keys must be unique
# useful to store datas

# program to convert three digits month name to full month name
# e.g. convert jan to january

monthConversions = {
    1: "January",
    2: "February",
    "Mar": "March",
    "Apr": "April",
    "May": "May",
    "Jun": "June",
    "Jul": "July",
    "Aug": "August",
    "Sep": "September",
    "Oct": "October",
    "Nov": "November",
    12: "December"
}

print(monthConversions[2])
print(monthConversions.get(13, "Not a valid key!"))