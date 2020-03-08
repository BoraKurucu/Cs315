# CS 315 Course Project

Lexical Analyzer for a Set Programming Language
This semester's projects are about the design of a new language for finite sets. This newly designed language will be similar to imperative languages with the main difference of only working with variables and expressions of the set type.

Part A - Language Design (40 points)
First, you will give a name to your language and design its syntax. Note that the best way to hand in your design is its grammar in BNF form, followed by a description of each of your language components. The following is a list of features required in your language:

Representing sets and set elements (names, numbers, other sets)
variable identifiers
operations for creating and deleting a set
set operators (e.g., union, intersection, ...)
set relations (e.g., subset, superset, ...)
assignment operator
statements for input / output sets
loops
function definitions and function calls.
comments
All of these features must be built-in your language. Do not assume importing from a library.

You are encouraged to use your imagination to extend the list given above.

You will have a chance to do minor revisions on your syntax design for Project 2, to be assigned later. Language designs are almost never exactly right in the first iteration. Just try your best to make it as readable/writable/usable/reliable as you can and keep your eyes open for what does and what does not work :)

Part B - Lexical Analysis (30 points)
In the second part of this project, you will design and implement a lexical analyzer for your language, using the lex tool available on Unix style systems. Your scanner should read its input stream and output a sequence of tokens corresponding to the lexemes defined in your language. Since at this stage you will not be able to connect the output to a parser, your scanner will print the names of the tokens on the screen. For instance, if we were designing a C like syntax, for the input

if ( answer == 2 ) { ...

the lexical analyzer should produce an output, similar to the following:

IF LP IDENTIFIER EQUAL_OP NUMBER RP LBRACE ...

Part C - Example Programs (30 points)
Finally, you will prepare test programs of your choice that exercises all of the language constructs in your language, including the ones that you may have defined in addition to the required list given above. Be creative, have some fun. Make sure your lex implementation correctly identifies all the tokens. The TA will test your lexical analyzer with these example programs along with other programs written in your language.

Do not panic! You are not required to write an interpreter or compiler for this language. Just write a few programs in the language you designed and make sure that the lexical analyzer produces the right sequence of tokens.
