# Problem Solvine Template
### Problem Description / Brief:
---
Madlibs Revisited
Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

Example output:

```
The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.
```

---
### Understand the Problem
(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)
Create a program that scans a document for:
nouns
verbs
adjectives
adverbs

Then replaces those words with random words of the appropriate type. 

The source text must be loaded from a file

Data structure is important in the exercise, choosing correctly will make this excercise easier.

---
### Examples / Test Cases
(Input / Output, Edge Cases? Bad input?)

Input: text
Output: text with nouns, verbs, adjectives and adverbs randomized if in our list.

Test: Manually create output from small sample text with expected output, then test if program output is the same.

Edge cases:
Words with punctuations at the end will need to be matched, ignoring the punctuation.

---
### Data Structures
(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)

text = STRING

words = ARRAY

The text string will be scanned, with whole words being replaced, from the array of words...

---
### Abstraction
(Solve in 1-2 sentences, solve small problems)
Scan the input text for words in the lists. Replace each word with another random word from that list.


---
### Algorithm
(Create algorithm using language of chosen data structure)
FOR each word in text
DO
  IF noun
    replace with random noun.
  IF adjectives
    replace with random adjectives.
  IF verb
    replace with random verb.
  IF adverb
    replace with random adverb.
END LOOP
Return new_text

---
### Psuedo Code
