# The Problem

## Crypto Square
Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

If man was meant to stay on the ground god would have given us roots

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

```
ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
```
The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:
```
imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
```

# Data Structure

Store normal and cipher text as arrays or strings

# The solution

Strip out all non-alphanumeric characters and downcase input.

Work out number of columns by rounding up the sqaure root of the string length

Split the normalised text into rows based on column length

create array of cipher text by looping through each index of the columns and adding the characters from each row to a new row in the cipher text array
 
