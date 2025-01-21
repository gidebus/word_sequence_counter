# Word Sequence Counter 

## Project Description
Word Sequence Counter is a CLI program that takes one or more `txt` files as input and prints
the 100 most common words repeated across the text(s) in a 3 word sequence. 

Ex. 
```
1. of the whale - 93
2. the sperm whale - 89
3. the white whale - 76
```

## Instructions
 Once file is unzipped navigate to the program directory `./word_sequence_counter` and run `bundle`. This will ensure
 that all dependencies are installed. Ex. the `rspec` gem for running the tests.

There are 3 main ways to run the program through the CLI while in the program directory. Please keep in mind
that file path will vary depending on where you are calling the file and its inputs from:

1. Run it with one or more file arguments:
```
ruby ./bin/starter some_txt_file.txt another_txt_file.txt
```

2. Pipe the file into the program:
```
ruby ./bin/starter < some_txt_file.txt
```
    
3. `cat` into the program:
```
cat ./text_files/moby-dick.txt | ruby ./bin/starter
```

## Running Tests

  Tests are written in `RSPEC` to run them run the following command from the main program directory:
  `rpsec`

  or the following for individual test suites:
  `rspec spec/some_spec.rb`


## Architecture

The program attempts to follow a loosely coupled object oriented style, utilizing dependancy injection on classes
when needed. Each class was written trying to accomplish the single responsibility principle, and kept as readable
as possible.

#### `starter`
This executable file is the one in charge of running the program. It will call and instantiate the 
`WordSequenceCounter` class. 

#### `word_sequence_counter.rb`
This file contains the class that controls the flow of the program. It initializes all classes with the 
exception of the `Parser` class, and proceeds to call each method in the right sequence.
A speed calculation was added using `Time.now` to make it easier for the reviewers to test speed on their computer. 
This however, was not part of the main design of the program.

#### `reader.rb`
This file contains the `Reader` class which depends on the `Parser` class given the functionality
of how `ARGV` works. I implemented `ARGF` over `ARGV` since it provides the user with more options to start the program
and capability of adding more than one `txt` file. Since `ARGV` already reads the input from console as a file it made sense
to parse each line already to prevent having to re-loop over another structure containing the text file and convering it
into another data structure of choice.

##### Limitations
There are no methods rescuing lack of incorrect command calls, etc.
It also treats title, index, and other non-essential data as part of the file.

##### Future Ideas
For future work this class could be split into more classes and have a reader for other types of files. Ex. `CSV` etc.
Also some sort of conditional or loop that involves `gets` would be a great implementation to improve user friendliness if they
forget to pass an argument etc.
Another future idea would be attempting to parse each file separately. As of now, if two files are given, the program concatonates
them into one and proceeds to parse it as such.

#### `parser.rb`
This contains the `Parser` class that uses `RegEx` to handle the requirements for parsing the file. Every other character, other than
lower case letters, and two versions of apostrophes will be turned into a space, and subsequently removed by using the `.split` method.

##### Limitations
Limitations of these are that words that contain a `-` will be split. Also by ignoring punctuation, we have other odd cases in which words
like `www.some_page.com` will be split into `['www', 'some_page', 'com']`. 

##### Future Ideas 
This class would be a major point of improvement in the future and with more time. As of now, the program accounts for the entire text file. This
inflates certain word sequence values that appear on the introduction, index, or other misc content that is not the core text itself.

In terms of speed, `RegEx` could be slower at times. For future work I would probably split the parsing of special characters into individual methods
or something similar to customize and parse the data in a cleaner way to reflect more accurate word sequencing.

#### `counter.rb`
The counter file implements the `Counter` class which sole purpose is to count the sequence of words and add the word and counter into a hash. The hash
then is incremented with each iteration.

This algorithm has a time complexity of BigO(n) as we are iterating through the array once. It also assumes that the type of sequencing we want starts from the
initial index of the previous word +1 as supposed to starting a new count after the end word of the 3 word sequence.

Ex.
```
  the sperm whale - 85
  sperm whale swims - 56
  whale swims away - 34
```

versus

```
  the sperm whale - 73
  swims away from - 34
  the boat chasing - 23
```

##### Future Ideas
This class could somehow be passed down an integer value in which the user could dictate how many words they want in their sequence!

#### `sorter.rb`
This file contains the `Sorter` class. Its sole purpose is to sort the hash by the count, reverse it to get a descending order, and only return
the first 100 words. 

##### Limitations
One limitation of the class is that the `sort_by` method returns a nested array, which then I had to reconvert it to a hash for consistency purposes, although
the program would still run if it was left as an array.

##### Future Ideas
For future work this class could also be passed down a variable from the user to allow it to list the amount of words the user would like.

#### `printer.rb`
The `Printer` class only purpose is to `puts` the hash in a more readable format on the console. It has a rank index that prints alongside the word to
denote its ranking. 

I believe this class was not needed as we are returning the values already into console on the `Sorter` class, but decided to include it to make it neater
for the user.

##### Future Ideas
Future work could be somehow pass down the title of the txt file from the `Reader` class and print it at the top.

### Test files
As a general upgrade to my testing suite. I would have added tools such as `FactoryBot` or `Fixture` to contain mock data to make the tests cleaner.

#### `parser_spec.rb`
The testing file for the `Parser` class tests for returning of the correct number of sequences, and tests for the handling of special characters. 
A future implementation could have been potentially splitting some of the special character cases into separate once to me more precises.


#### `printer_spec.rb`
The `Printer` test suite was a tricky one. I had to search for an implementation for testing output to the console. I added instances of attempting to
printing values not in the array, and then printing the same value in an array that contained it to ensure it works.

#### `sorter_spec.rb`
`Sorter` test suite tests for order of descending order by value and that only 100 items are returned. Also it tests for the case in which the hash could 
contain less than 100 values.

#### `reader_spec.rb`
The `Reader` test suite was skipped due to complexity. I somehow had to mock a call to and instance of `STDOUT` so that `ARGV` could pick the file path. 
I left the test as 'skipped' to show intent of completion, and perhaps initial thought process.

### Final Thoughts
Thanks for sticking with me through this README. It was lengthy but wanted to share thought process for limitations and future potential work if had more time
as much as possible.

This project also pushed me to learn new things such as testing `puts` outputs on `rspec`, use of `ARGF` versus `ARGV`! as well as the sole purpose
of getting more practice on object oriented programming. It also helped me notice some personal points of improvement such as development speed, or certain topics
of general development.

Gil
