1) a method that returns the sum of two integers

Casual:
Given two numbers:
  - Add both numbers
  - Return sum

Formal: 

START

# Given two numbers

number1 + number2

END
--------------------------------------------------------------------------------
2) a method that takes an array of strings, and returns a string that is all those strings concatenated together 

Casual:
Given an array of strings:
  - Set an empty string variable
  - Iterate over the array
  - Add each element of the array to the string variable
  - Return string variable

Formal:

START

# Given an array of strings

SET empty_string = ""

FOR each element in array
  empty_string += element

RETURN empty_string

END
--------------------------------------------------------------------------------
3) a method that takes an array of integers, and returns a new array with every other element

Casual:
Given an array of integers:
  - Set an empty array variable
  - Set an iterator variable to 1
  - Loop while iterator is less than the array length
  - Add given array's iterator element to the new array
  - Add 2 to iterator
  - Return new array

Formal:

START

# Given an array of integers

SET new_array = []
SET iterator = 1

WHILE iteraror < array length
  add element[iterator] to new_array
  iterator += 2

RETURN new_array

END