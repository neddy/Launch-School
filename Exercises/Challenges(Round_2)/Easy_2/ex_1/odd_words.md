# Problem Solving Template

Character set = letters space point (No numbers or other punctuations)

Words are between 1-20 characters long.

Input consists of one or more words, separated by one or more spaces, and terminated by 0 or more spaces and a point.

output is to be formatted such that words are separated by one space, and terminated by a point.

Odd words are to be copied in reverse format, even words are to be echoed.

Example test case

"whats the matter with kansas." becomes "whats eht matter htiw kansas."

Bonus points: characters must be read and printed one at a time.

Assumptions:

ignore case of letters. Just output them as they are.

### Understand the Problem
(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

Take a string as input, split the string up by spaces. All strings will be terminated by a point.

output the string with all words separated by only only one space, and terminated by a point.



### Examples / Test Cases
(Input / Output, Edge Cases? Bad input?)




### Data Structures
(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)

first solution: Array

bonus points: string





### Abstraction
(Solve in 1-2 sentences, solve small problems)

first solution split words into array (remove point), then reverse every second word and then join them up and add point on the end.

iterate over characters, finding word boundaries and then use indexes to output characters.



### Algorithm / Psuedo Code
(Create algorithm using language of chosen data structure)

first solution:
remove points from string, then split words based on one or more spaces.
loop over words array and reverse every second word.
join words with one space and add point to end.


bonus points

read each character, keep track of wether current word is odd, if it is, then read until the end of the word and then output from the last letter to the first.

read first character, if it's a letter, set the flag word_even to true

loop until point is found in string.

  if even word
    use method to output word in normal direction
    pass in index of first character
    return index of last character and invert flag
  
  if odd word
    method should find last character of odd word
    then ouput in reverse
    then return index of last character  and invert flag

  check character after returned index, if is a point, then output a point and exit the loop
  otherwise increase index by one and check again, if it is a character, ouput a space and call either odd or even method as per flag

end loop

  
