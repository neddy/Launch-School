#!/usr/bin/env ruby

def first_word(input_file, output_file)
  File.open(input_file, 'r').each do |line|
    File.open(output_file, 'a') do |f|
      f << line.split[0] + "\n"
    end
  end
end

# first_word("raw_adjective.txt", "cleaned_adjective.txt")

def de_dup_file(input_file, output_file)
  words = []
  File.open(input_file, 'r').each do |line|
    words << line
  end
  words.uniq!
  File.open(output_file, 'a') do |f|
    words.each do |word|
      f << word
    end
  end
end

# de_dup_file("cleaned_adjective.txt", "adjectives.txt")

def silgle_word_line(input_file, output_file)
  words = []
  File.open(input_file, 'r').each do |line|
    words << line.split
  end
  words.flatten!
  words.uniq!
  File.open(output_file, 'a') do |f|
    words.each do |word|
      f << word + "\n"
    end
  end
end

# silgle_word_line("raw_verbs.txt", "cleaned_verbs.txt")
