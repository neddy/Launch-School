# The Problem

Write a program that creates robot names, such as RX837 or BC811. The names should start with two uppercase letters, and then 3 numbers. The names should be unique. There should be the option to reset  the name. A different name should be assigned.

Methods:

Robot.new: Creates a robot with a new unique name
Robot.name: Returns the name of the robot
Robot.reset: Resets the robot and gives it a new unique name

# Data

Store name in variable. Store past names in a txt file (Start with a class variable).

# The solution

Write a program that creates a random name when a robot is created or reset, and ensure the name has not been used before.

To generate first two random letters, generate random number between 65-90 (ASCII values for 'A' and 'Z'). Then convert to letters, and then generate random number between 100-999 for last 3 numbers.

Check if name is unique, if not generate again.
