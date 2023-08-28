<h1 align="center"> Project Report </h1>

<h2> table of contents </h2>
<ul>
  <li> Overview </li>
  <li> Technical Details </li>
  <li> Project Goals </li>
</ul>

## Overview 

<p> 
This project is a parser application, following the course of Douglas Thain. The programming language here contains variables, 
arrays, functions and basic arithmetic operators. C frameworks like flex and bison(yacc) have been used in this project, these
frameworks can be used with C++, but I chose to use them with C. 
</p>
<p>
Some basic rules of this language that should be kept in mind are -
<ul>
  <li>statements must be ended with semi colon</li>
  <li> bracket rules are same as C</li>
  <li>Identifier names should start with an uppercase alphabet </li>
  <li> array and function declarations are a bit different, can be seen in the text.txt file for proper syntax </li>
</ul>
</p>
<p> 
This project is an amazing stepping stone to someone who wants to understand beginner level compiler and language design. A
compiler has three stages, scanning, parsing and semantic analysis, and code generation. Right now, I have only implemented 
scanning and parsing, these stages check the verification of the tokens and there use in a sentence with the correct grammar. 
</p>
<p>
Details on how to use and modify the project are given in the readme of the file 
</p>

## Technical Details and Challenges
<p> 
This section offers some technical details for a reviewer to understand the project in a better sense. For a person not
interested in the workings can skip this section
</p>

### Scanners 

<p> 
As said before, a compiler is divided into three stages. First is scanning, scanning is basically the verification of
tokens in a language, tokens are the building blocks of a porgramming language, examples - "+", "while", identifiers etc. To
define the tokens of a language, one should be aware about the concepts of regular expressions. <br>
Regular expressions(REs) are strings that contain information about some collection of strings. For eg - 
</p>
<p>The RE [a-z]+ dictates all the strings that have zero or more lowercase letters. </p>

<p>
flex uses the concept of deterministic finite automaton to generate scanners, there are many algorithms and simplifications 
that we are not gonna get into right now, and can be seen in the book of Douglas Thain for the curious reader 
</p>

### Challenges in scanners

<p>
The challenges one could encounter is to come up with different regular expressions for different things, for single keywords
these definitions are easy, for more general expressions like identifiers and strings, these expressions must be used with caution
to account for all test cases, these could be solved with the help of practice and a better understanding of Regular Expressions
</p>

### Parsing 

<p>
The next stage is parsing, this stage makes sure that the tokens are used in a right manner, a "+" operator after a "while" doesn't
make any sense, thus parsing exists. Type checking and scope checking are also done in the semantic analysis in parsing, but they 
are done after making of the Abstract Syntax Tree(AST).
</p>
<p>
We use grammars for parsing, every language in the world has some sort of grammar, and programming languages are no excecption, 
these grammars are very similar to how we see grammar in English, every statement has an allowed format, first there should 
be noun blah blah blah. Grammars are of many types, LL, SLR, LR etc. A parser for an LL grammar can be made with pure C by hand,
but LL grammars cannot represent more dynamic and general programming structures. 
</p>
<p>
Parsing is also done with the help of finite automaton, in case of LR grammars, this is called the LR(1) automaton. Sometimes
these automatons need to be analysed in the y.output file for resolving conflicts. Steps to generate the y.output file is 
given in the readme of the project.
</p>
<p>
But since these grammars are interpreted by a computer, saying like something is obvious given the context doesn't hold any
value, and they make up certain challenges in making grammars. Again, the curious reader should check out the book by 
Douglas Thain for a better understanding on how hectic solving these challenges can become
</p>

### Challenges in parsing

<p>
Machines can get really confused when dealing with the if-else conditional statements, it cannot decide whether it should 
continue the current else with the if, or end the statement at if and take the else for a different if, this is a very famous
problem in compiler design known as the dangling else problem.
</p>
<p>
These types of conflicts arise a lot while making grammars, and finding their solutions can take a lot of time, these problems 
can be overcome by having a better understanding of grammar making, and constantly debugging the current grammars to resolve
conflicts. These conflicts are of two types: shift-reduce conflicts, reduce-reduce conflicts.
</p>
<p>
Even after these conflicts have been resolved doesn't mean your grammar is a good one, we still have to see if our grammar is
enveloping statements in a consisting manner over all statements, inconsistencies can cause problems in later stages,
a good way to see this is to follow the parser step by step(you can use the parsing algorithm given in the book) and see 
how your language is enveloping all statements.
</p>

### Abstract Syntax Tree(AST)
<p>
The AST is a tree like structure that represents the structure of a program to be interpreted for further stages of compiler, 
it is also used to apply optimisations, implement typechecking and scopechecking. Even though it may seem easy to make an AST
of a program, this is a major challenge as the nodes are made of structures and can complicate the tree too much
</p>
<img src = "https://github.com/SiddharthVikram069/compiler-prog/blob/main/AST.png?raw=true"> 
<p>
Above image is the AST just for a 5 line function declaration
</p>
<p>
I haven't incorporated the AST in the main branch yet because, it cannot be tested until typechecking and scopechecking are 
implemented, so I will have to first do those and if they are working, then only I can merge the test branch in the 
main branch.
</p>

### challenges in AST

<p>
Of course the complicated structure of the AST is a huge task to understand and overcome, Douglas Thain's book helped a lot in 
this phase, it's almost impossible for a beginner to make an AST without some sort of reference. But you must remember the book
is just a reference and you would have to incorporate some extra things and functions to make it work for your grammar.
</p>

## Project Goals 

- [x] making a scanner
- [x] making a conflict free grammar for the language
- [x] generating the parser and the header with bison(yacc)

### Some Additional Goals 

- [x] making the Abstract Syntax Tree(AST)
  - [x] Making header files for the nodes and construction functions of the AST
  - [x] Incorporating those functions in the .y file 
- [ ] Implement typechecking and scopechecking 
